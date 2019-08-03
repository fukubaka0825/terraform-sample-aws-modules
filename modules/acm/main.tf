/* zoneのドメインと、subject_alternative_names全ての証明書を発行し、有効性チェック用のDNSレコードも作ってくれるやつ*/
/* route53_zone */
data "aws_route53_zone" "default" {
  name = var.route53_zone_name
}

/* acm */
resource "aws_acm_certificate" "default" {
  domain_name               = data.aws_route53_zone.default.name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }
}

#証明書検証用DNSレコード
resource "aws_route53_record" "default" {
  count      = var.number_of_records
  zone_id    = data.aws_route53_zone.default.id
  name       = aws_acm_certificate.default.domain_validation_options[count.index]["resource_record_name"]
  type       = aws_acm_certificate.default.domain_validation_options[count.index]["resource_record_type"]
  ttl        = var.validate_ttl
  records    = [aws_acm_certificate.default.domain_validation_options[count.index]["resource_record_value"]]
  depends_on = [aws_acm_certificate.default]

  lifecycle {
    ignore_changes = []
  }
}