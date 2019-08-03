/* s3 */
resource "aws_s3_bucket" "default" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  versioning {
    enabled = var.versioning
  }
  policy = var.policy

  #重要なリソースは必ずこいつを
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.default.id

  lambda_function {
    lambda_function_arn = var.function_arn
    events              = var.events
    //filter_prefix       = "/"
    filter_suffix = var.filter_suffix
  }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.default.arn
}
