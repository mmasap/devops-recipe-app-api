resource "aws_route53_zone" "zone" {
  name = var.dns_zone_name
}
