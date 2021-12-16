resource "aws_lb" "cotb_dev_lab_lb" {
  # The name of the LB.
  name                = "cotb-dev-lab"
  # If true, the LB will be internal.
  internal            = false
  # The type of load balancer to create.
  load_balancer_type  = "application"
  # A list of security group IDs to assign to the LB.
  security_groups    = [aws_security_group.cotb_dev_lab_sg.id]
  # A list of subnet IDs to attach to the LB.
  subnets            = [for subnet in aws_subnet.cotb_dev_lab_subnets : subnet.id]
  # If true, deletion of the load balancer will be disabled via the AWS API.
  enable_deletion_protection = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
resource "aws_lb_target_group" "cotb_dev_lab_http_tg" {
  name     = "cotb-dev-lab-http-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.cotb_dev_lab_vpc.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
resource "aws_lb_listener" "cotb_dev_lab_listener" {
  load_balancer_arn = aws_lb.cotb_dev_lab_lb.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cotb_dev_lab_http_tg.arn
  }
}