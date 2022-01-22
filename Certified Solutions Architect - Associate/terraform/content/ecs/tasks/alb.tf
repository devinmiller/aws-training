resource "aws_lb" "cotb_cluster_load_balancer" {
  name               = "cotb-cluster-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.instances.outputs.cotb_cluster_public_sg]
  subnets            = data.terraform_remote_state.cluster.outputs.cotb_cluster_public_subnets

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "cotb_cluster_lb_tg" {
  name     = "cotb-cluster-lb-tg"
  target_type = "ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.cluster.outputs.cotb_cluster_vpc.id

  health_check {
    enabled = true
    port = 8404
  }
}

resource "aws_lb_listener" "cotb_cluster_listener_front_end" {
  load_balancer_arn = aws_lb.cotb_cluster_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cotb_cluster_lb_tg.arn
  }
}

data "aws_route53_zone" "cotb_dev_zone" {
  name         = "cotb.dev."
  private_zone = false
}

resource "aws_route53_record" "www_task_one" {
  zone_id = data.aws_route53_zone.cotb_dev_zone.zone_id
  name    = "taskone.cotb.dev"
  type    = "A"
  alias {
    name                   = aws_lb.cotb_cluster_load_balancer.dns_name
    zone_id                = aws_lb.cotb_cluster_load_balancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_task_two" {
  zone_id = data.aws_route53_zone.cotb_dev_zone.zone_id
  name    = "tasktwo.cotb.dev"
  type    = "A"
  alias {
    name                   = aws_lb.cotb_cluster_load_balancer.dns_name
    zone_id                = aws_lb.cotb_cluster_load_balancer.zone_id
    evaluate_target_health = true
  }
}