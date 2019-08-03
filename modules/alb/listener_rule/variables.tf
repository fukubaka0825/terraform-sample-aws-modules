/* required */
variable "listener_arn" {}
variable "target_group_arn" {}

/* optional */
variable "priority" {
  default = 100
}
variable "action_type" {
  default = "forward"
}

variable "condition_field" {
  default = "path-pattern"
}

variable "condition_values" {
  default = ["/*"]
}