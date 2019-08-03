resource "aws_sfn_activity" "sfn_activity" {
  name = var.activity_name
  tags = var.activity_tags
}

resource "aws_sfn_state_machine" "default" {
  name       = var.state_machine_name
  role_arn   = var.sfn_role
  definition = data.template_file.default.rendered
}

data "template_file" "default" {
  template = var.template
  //TODO 複数workerも設定できるように
  vars = {
    ACTIVITY_WORKER_ARN = aws_sfn_activity.sfn_activity.id
  }
}
