/* required */
variable "instance_profile_name" {}
variable "iam_role_name" {}
variable "subnet_id" {}
variable "ssm_log_bucket_id" {}
variable "cloudwatch_log_group_name" {}

/* もし同一アカウントで2台目のopsserver立てるなら 名前被っちゃうので required */
variable "session_manager_run_shell_name" {
  default = "SSM-SessionManagerRunShell"
}

/* optional */
variable "ami" {
  default = "ami-0f9ae750e8274075b"
}
variable "instancetype" {
  default = "t3.micro"
}
variable "user_data" {
  default = null
}
variable "associate_public_ip_address" {
  default = true
}
variable "retention_in_days" {
  default = 180
}