resource "aws_lb_listener_rule" "default" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type             = var.action_type
    target_group_arn = var.target_group_arn
  }

  condition {
    field  = var.condition_field
    values = var.condition_values
  }
}

