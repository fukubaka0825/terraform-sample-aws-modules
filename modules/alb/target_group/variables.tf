/* required */
variable "target_group_name" {}
variable "alb" {}
variable "vpc_id" {}
/* optional */
variable "target_type" {
  default = "instance"
}
variable "target_port" {
  default = "80"
}
variable "target_protocol" {
  default = "HTTP"
}
variable "deregistration_delay" {
  default = 300
}
variable "health_check_obj" {
  type = object({
    path                = string
    healthy_threshold   = number
    unhealthy_threshold = number
    timeout             = number
    interval            = number
    matcher             = number
    port                = string
    protocol            = string
  })
  default = {
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = 200
    port                = "traffic-port"
    protocol            = "HTTP"
  }
}
