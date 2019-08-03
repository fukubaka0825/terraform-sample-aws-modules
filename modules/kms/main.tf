/* kms */
resource "aws_kms_key" "default" {
  description             = var.kms_key_description
  enable_key_rotation     = var.enable_key_rotation
  is_enabled              = var.is_enabled
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "default" {
  name          = var.kms_alias_name
  target_key_id = aws_kms_key.default.key_id
}

