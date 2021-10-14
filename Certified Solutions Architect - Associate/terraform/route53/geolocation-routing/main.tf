terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/route53/geolocation-routing.tfstate"
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
  region  = "us-west-2"
  alias   = "uswest2"
}

provider "aws" {
  region  = "us-east-2"
  alias   = "useast2"
}

provider "aws" {
  region  = "eu-west-2"
  alias   = "euwest2"
}

provider "aws" {
  region = "us-west-2"
}

data "aws_route53_zone" "route53_zone" {
  name         = "slightlybuggy.com."
  private_zone = false
}

resource "aws_route53_record" "www_na" {
  # The Hosted Zone id of the desired Hosted Zone
  zone_id = data.aws_route53_zone.route53_zone.zone_id
  name    = data.aws_route53_zone.route53_zone.name
  type    = "A"
  ttl     = "60"

  geolocation_routing_policy {
    continent = "NA"
  }

  set_identifier = "uswest2"

  records = [
    aws_instance.cotb_dev_web_usw2.public_ip,
    aws_instance.cotb_dev_web_use2.public_ip
  ]
}

resource "aws_route53_record" "www_eu" {
  # The Hosted Zone id of the desired Hosted Zone
  zone_id = data.aws_route53_zone.route53_zone.zone_id
  name    = data.aws_route53_zone.route53_zone.name
  type    = "A"
  ttl     = "60"

  geolocation_routing_policy {
    continent = "EU"
  }

  set_identifier = "euwest2"

  records = [
    aws_instance.cotb_dev_web_euw2.public_ip
  ]
}