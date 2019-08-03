/* source s3のみ対応　*/
resource "aws_codepipeline" "default" {
  name     = var.pipeline_name
  role_arn = var.role_arn

  stage {
    name = var.source_stage_name

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = 1
      output_artifacts = ["Source"]

      configuration = {
        S3Bucket    = var.S3Bucket
        S3ObjectKey = var.S3ObjectKey

        ### CodePipelineによるPollingでオブジェクトの変更を検知する機能
        ### CW Eventsによる検知が使えるため非推奨
        ### CLIで設定する場合は明示的に無効化する必要がある
        PollForSourceChanges = var.PollForSourceChanges
      }
    }
  }

  stage {
    name = var.build_stage_name

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = 1
      input_artifacts  = ["Source"]
      output_artifacts = ["Build"]

      configuration = {
        ProjectName = var.ProjectName
      }
    }
  }

  stage {
    name = var.deploy_stage_name

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = 1
      input_artifacts = ["Build"]

      configuration = {
        ClusterName = var.ClusterName
        ServiceName = var.ServiceName
        FileName    = var.FileName
      }
    }
  }

  artifact_store {
    location = var.artifact_store_location
    type     = var.artifact_store_type
  }

}

#以下のリソースはs3にソースがputされたらpipelineをキックするために必要
/* cloudwatch */
resource "aws_cloudwatch_event_rule" "default" {
  name          = var.pipeline_name
  description   = var.pipeline_name
  event_pattern = data.template_file.default.rendered
}

resource "aws_cloudwatch_event_target" "default" {
  rule      = var.pipeline_name
  target_id = var.pipeline_name
  role_arn  = var.cw_role
  arn       = aws_codepipeline.default.arn
}

data "template_file" "default" {
  template = file("${path.module}/pipeline.json")

  vars = {
    S3Bucket    = var.S3Bucket
    S3ObjectKey = var.S3ObjectKey
  }
}

/* cloudtrail */
data "aws_s3_bucket" "important-bucket" {
  bucket = var.S3Bucket
}

resource "aws_cloudtrail" "default" {
  name                          = var.pipeline_name
  s3_bucket_name                = var.cloudtrail_s3_id
  s3_key_prefix                 = var.cloudtrail_s3_key_prefix
  include_global_service_events = false

  event_selector {
    read_write_type           = "WriteOnly"
    include_management_events = true

    data_resource {
      type = "AWS::S3::Object"

      # Make sure to append a trailing '/' to your ARN if you want
      # to monitor all objects in a bucket.
      values = ["${data.aws_s3_bucket.important-bucket.arn}/${var.S3ObjectKey}"]
    }
  }
}
