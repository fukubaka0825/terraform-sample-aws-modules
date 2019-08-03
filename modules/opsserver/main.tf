/* configure */
/* ssm ec2 */
resource "aws_iam_instance_profile" "default" {
  name = var.instance_profile_name
  role = var.iam_role_name
}

resource "aws_instance" "default" {
  ami                         = var.ami
  instance_type               = var.instancetype
  iam_instance_profile        = aws_iam_instance_profile.default.name
  subnet_id                   = var.subnet_id
  user_data                   = var.user_data == null ? local.user_data : var.user_data
  associate_public_ip_address = var.associate_public_ip_address
}

resource "aws_cloudwatch_log_group" "operation" {
  name              = var.cloudwatch_log_group_name
  retention_in_days = 180
}

resource "aws_ssm_document" "session_manager_run_shell" {
  name            = var.session_manager_run_shell_name
  document_type   = "Session"
  document_format = "JSON"

  content = <<EOF
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "${var.ssm_log_bucket_id}",
      "cloudWatchLogGroupName": "${aws_cloudwatch_log_group.operation.name}"
    }
  }
EOF
}

locals {
  user_data = <<EOF
#!/bin/sh
amazon-linux-extras install -y docker
systemctl start docker
systemctl enable docker
sudo $(aws ecr get-login --no-include-email --region ap-northeast-1)
sudo docker pull 735493774784.dkr.ecr.ap-northeast-1.amazonaws.com/laboon-test-ci
sudo docker run -itd 735493774784.dkr.ecr.ap-northeast-1.amazonaws.com/laboon-test-ci /bin/bash
EOF
}