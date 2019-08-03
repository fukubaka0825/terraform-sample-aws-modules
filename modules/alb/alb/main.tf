resource "aws_lb" "default" {
  name                       = var.alb_name
  load_balancer_type         = var.load_balancer_type
  internal                   = var.internal
  idle_timeout               = var.idle_timeout
  enable_deletion_protection = var.enable_deletion_protection

  subnets = var.subnets

  access_logs {
    bucket  = var.access_logs_bucket_id
    enabled = var.enabled
  }

  security_groups = var.alb_security_groups
}
