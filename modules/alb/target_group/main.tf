resource "aws_lb_target_group" "default" {
  name                 = var.target_group_name
  vpc_id               = var.vpc_id
  target_type          = var.target_type
  port                 = var.target_port
  protocol             = var.target_protocol
  deregistration_delay = var.deregistration_delay

  health_check {
    path                = var.health_check_obj["path"]
    healthy_threshold   = var.health_check_obj["healthy_threshold"]
    unhealthy_threshold = var.health_check_obj["unhealthy_threshold"]
    timeout             = var.health_check_obj["timeout"]
    interval            = var.health_check_obj["interval"]
    matcher             = var.health_check_obj["matcher"]
    port                = var.health_check_obj["port"]
    protocol            = var.health_check_obj["protocol"]
  }

  depends_on = [var.alb]
}
