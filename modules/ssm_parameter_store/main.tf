resource "aws_ssm_parameter" "laboon_basic_auth_user" {
  name        = var.name
  value       = var.value
  type        = var.type
  description = var.description
  lifecycle {
    ignore_changes = [value]
  }
}