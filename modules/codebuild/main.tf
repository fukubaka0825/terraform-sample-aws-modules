/* codebuild */
resource "aws_codebuild_project" "default" {
  name         = var.aws_codebuild_project_name
  description  = var.aws_codebuild_project_description
  service_role = var.codebuild_service_role

  cache {
    type  = var.cache_type
    modes = var.cache_modes
  }

  environment {
    compute_type                = var.compute_type
    image                       = var.image
    type                        = var.type
    image_pull_credentials_type = var.image_pull_credentials_type
    privileged_mode             = var.privileged_mode


    dynamic "environment_variable" {
      for_each = [for s in var.environment_variable : {
        name  = s.name
        value = s.value
        type  = s.type
      }]
      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
        type  = environment_variable.value.type
      }
    }

  }

  source {
    type      = var.source_type
    location  = var.source_location
    buildspec = var.buildspec
  }

  artifacts {
    type = var.artifacts_type
  }

  tags = var.codebuild_tags
}

