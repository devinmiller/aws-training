terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/route53/simple-routing.tfstate"
    dynamodb_table  = "aws_cotb_dev_terraform_state"
    region          = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

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
  records = aws_instance.cotb_dev_web.*.public_ip
}