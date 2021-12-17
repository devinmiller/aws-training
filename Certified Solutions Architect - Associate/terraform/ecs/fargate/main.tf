terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/fargate/cluster.tfstate"
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

variable ssh_key {
  type = string
  default = "work-ssh-key-pair"
  description = "Name of the SSH key pair to use with instance"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster
resource "aws_ecs_cluster" "cotb_dev_cluster" {
  name = "cotb-dev-cluster"
} 

resource "aws_ecs_task_definition" "web_task" {
  # A unique name for your task definition
  family                    = "web-service"
  # Set of launch types required by the task.
  requires_compatibilities  = ["FARGATE"]
  # Docker networking mode to use for the containers in the task.
  network_mode              = "awsvpc"
  # ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume.
  execution_role_arn        = aws_iam_role.cotb_dev_lab_ecs_role.arn
  # Number of cpu units used by the task.
  cpu                       = 512
  # Amount (in MiB) of memory used by the task.
  memory                    = 2048
  # A list of valid container definitions provided as a single valid JSON document
  container_definitions = jsonencode([
    {
      name      = "nginx"
      image     = "nginx:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "web_service" {
  # Name of the service.
  name            = "nginx"
  # ARN of an ECS cluster.
  cluster         = aws_ecs_cluster.cotb_dev_cluster.id
  # Family and revision or full ARN of the task definition that you want to run in your service.
  task_definition = aws_ecs_task_definition.web_task.arn
  # Number of instances of the task definition to place and keep running.
  desired_count   = 2
  # Launch type on which to run your service.
  launch_type     = "FARGATE"

  # Configuration block for load balancers.
  load_balancer {
    target_group_arn = aws_lb_target_group.cotb_dev_lab_http_tg.arn
    container_name   = "nginx"
    container_port   = 80
  }

  # Network configuration for the service. 
  network_configuration {
    # Subnets associated with the task or service.
    subnets = [for subnet in aws_subnet.cotb_dev_lab_subnets : subnet.id]
    # Security groups associated with the task or service.
    security_groups    = [aws_security_group.cotb_dev_lab_sg.id]
    # Assign a public IP address to the ENI.
    assign_public_ip = true
  }
}