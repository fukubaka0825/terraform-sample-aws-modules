/* required */
variable "task_difinition_family" {}
variable "execution_role_arn" {}
variable "container_definitions" {}
/* optional */
variable "cpu" {
  default = "256"
}
variable "memory" {
  default = "512"
}
variable "network_mode" {
  default = "bridge"
}
variable "requires_compatibilities" {
  default = ["EC2"]
}
