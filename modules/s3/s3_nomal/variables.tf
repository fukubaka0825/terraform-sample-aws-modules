/* required */
variable "bucket_name" {
}

/* option */
variable "versioning" {
  default = true
}

variable "force_destroy" {
  default = true
}

variable "block_public_acls" {
  default = true
}

variable "block_public_policy" {
  default = true
}

variable "ignore_public_acls" {
  default = true
}

variable "restrict_public_buckets" {
  default = true
}
variable "policy" {
  default = null
}

