data "aws_route53_zone" "default" {
  name = var.route53_zone_name
}


resource "aws_route53_record" "default" {
  zone_id = data.aws_route53_zone.default.zone_id
  name    = var.route53_record_name
  type    = var.record_type

  alias {
    name                   = var.alias_name
    zone_id                = var.alias_zone_id
    evaluate_target_health = true
  }
}
