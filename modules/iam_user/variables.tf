/* required */
variable "aws_iam_user_name" {
}

variable "aws_iam_policy_name" {
}

variable "aws_iam_policy_description" {
}

variable "aws_iam_policy" {
}

variable "pgp_key" {
}

/* if you want to login using this user, required */
variable "is_login_profile" {
  default = false
}

