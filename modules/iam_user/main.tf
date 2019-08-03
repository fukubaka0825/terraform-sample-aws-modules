resource "aws_iam_user" "default" {
  name = var.aws_iam_user_name
}

resource "aws_iam_policy" "default" {
  name        = var.aws_iam_policy_name
  description = var.aws_iam_policy_description
  policy      = var.aws_iam_policy
}

resource "aws_iam_user_policy_attachment" "default" {
  user       = aws_iam_user.default.name
  policy_arn = aws_iam_policy.default.arn
}

resource "aws_iam_user_login_profile" "default" {
  count   = var.is_login_profile ? 1 : 0
  user    = aws_iam_user.default.name
  pgp_key = var.pgp_key
}

resource "aws_iam_access_key" "default" {
  user    = aws_iam_user.default.name
  pgp_key = var.pgp_key
}

