/* required */
variable "service_name" {}
variable "cluster_arn" {}
variable "cluster_name" {}
variable "role_arn" {}
variable "task_definition" {}
variable "desired_count" {}
variable "max_capacity" {}
variable "min_capacity" {}
/* load_balancer argumentを設定したいなら　requierd */
variable "has_load_balancer" {
  description = "もしload_balancer argumentを設定したいなら、trueを入れる"
  default     = false
}
/* load_balancer argumentを設定したら requierd　*/
variable "target_group_arn" {
  default = null
}
variable "container_name" {
  default = null
}
variable "health_check_grace_period_seconds" {
  default = null
}
variable "container_port" {
  default = 80
}