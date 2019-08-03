/* s3 */
resource "aws_s3_bucket" "default" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  versioning {
    enabled = var.versioning
  }
  policy = var.policy

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  #重要なリソースは必ずこいつを
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = aws_s3_bucket.default.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}


