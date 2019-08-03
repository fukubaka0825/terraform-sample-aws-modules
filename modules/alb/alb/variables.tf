/* required */
variable "alb_name" {}
variable "subnets" {}
variable "access_logs_bucket_id" {}
variable "alb_security_groups" {}
/* optional */
variable "load_balancer_type" {
  default = "application"
}
variable "internal" {
  default = false
}
variable "idle_timeout" {
  default = 60
}
variable "enable_deletion_protection" {
  default = true
}
variable "enabled" {
  default = true
}

