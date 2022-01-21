resource "aws_lb" "cotb_cluster_load_balancer" {
  name               = "cotb-cluster-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.instances.outputs.cotb_cluster_public_sg]
  subnets            = data.terraform_remote_state.cluster.outputs.cotb_cluster_public_subnets

  enable_deletion_protection = true
}

resource "aws_lb_target_group" "cotb_cluster_lb_tg" {
  name     = "cotb-cluster-lb-tg"
  target_type = "ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.cluster.outputs.cotb_cluster_vpc.id
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