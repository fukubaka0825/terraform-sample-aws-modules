## 以下でoutputをdecryptする
##terraform output ci_push_user_access_encrypted_secret | base64 --decode | keybase pgp decrypt.
##decryptしたときに最後に着く%は無視する
output "access_encrypted_secret" {
  value = aws_iam_access_key.default.encrypted_secret
}

//## 以下でoutputをdecryptする
##terraform output encrypted_secret | base64 --decode | keybase pgp decrypt.
##decryptしたときに最後に着く%は無視する
output "password" {
  value = aws_iam_user_login_profile.default[0].encrypted_password
}

output "access_key" {
  value = aws_iam_access_key.default.id
}

