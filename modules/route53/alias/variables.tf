/* required */
variable "route53_zone_name" {}
variable "route53_record_name" {}
variable "record_type" {}
variable "alias_name" {}
variable "alias_zone_id" {}
/* optional */
variable "evaluate_target_health" {
  default = true
}