/* s3 */
resource "aws_s3_bucket" "default" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  versioning {
    enabled = var.versioning
  }
  policy = var.policy

  lifecycle_rule {
    enabled = var.enable

    expiration {
      days = var.expire_days
    }
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.default.id
  policy = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.default.id}/*"]

    principals {
      type        = "AWS"
      identifiers = var.identifiers
    }
  }
}

