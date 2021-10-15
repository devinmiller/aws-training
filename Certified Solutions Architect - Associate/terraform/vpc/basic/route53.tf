data "aws_route53_zone" "route53_zone" {
  name         = "slightlybuggy.com."
  private_zone = false
}

resource "aws_route53_record" "www" {
  # The Hosted Zone id of the desired Hosted Zone
  zone_id = data.aws_route53_zone.route53_zone.zone_id
  name    = data.aws_route53_zone.route53_zone.name
  type    = "A"
  ttl     = "60"
  records = [aws_instance.cotb_dev_web_instance.public_ip]
}