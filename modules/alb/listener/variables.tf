/* required */
variable "alb_arn" {}
variable "listener_port" {}
variable "listener_protocol" {}
/* if HTTPS   required  */
variable "ssl_policy" {
  default = null
}
variable "certificate_arn" {
  default = null
}

/* optional */
variable "default_action_type" {
  default = "fixed-response"
}
variable "content_type" {
  default = "text/plain"
}
variable "message_body" {
  default = "ok"
}
variable "status_code" {
  default = "200"
}
