/* required */
variable "route53_zone_name" {
}

variable "subject_alternative_names" {
}

variable "number_of_records" {}

/* optional */
variable "validation_method" {
  default = "DNS"
}

variable "validate_ttl" {
  default = 300
}

