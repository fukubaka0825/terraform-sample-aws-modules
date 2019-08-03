/* required */
variable "kms_key_description" {
}

variable "kms_alias_name" {
}

/* optional */
variable "enable_key_rotation" {
  default = true
}

variable "is_enabled" {
  default = true
}

variable "deletion_window_in_days" {
  default = 30
}

