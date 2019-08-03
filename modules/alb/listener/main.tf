resource "aws_lb_listener" "default" {
  load_balancer_arn = var.alb_arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn
  default_action {
    type = var.default_action_type

    fixed_response {
      content_type = var.content_type
      message_body = var.message_body
      status_code  = var.status_code
    }
  }
}
