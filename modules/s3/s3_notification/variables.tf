/* required */
variable "bucket_name" {
}
variable "function_arn" {}
variable "function_name" {}
variable "events" {}
variable "filter_suffix" {}
/* optional */
variable "versioning" {
  default = true
}

variable "force_destroy" {
  default = true
}

variable "policy" {
  default = null
}

