terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/ecs/cluster.tfstate"
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

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster
resource "aws_ecs_cluster" "cotb_dev_cluster" {
  name = "cotb-dev-cluster"
} 

resource "aws_ecs_task_definition" "web_task" {
  # A unique name for your task definition
  family = "web-service"
  # A list of valid container definitions provided as a single valid JSON document
  container_definitions = jsonencode([
    {
      name      = "nginx"
      image     = "nginx"
      cpu       = 10
      memory    = 512
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
  name            = "nginx"
  cluster         = aws_ecs_cluster.cotb_dev_cluster.id
  task_definition = aws_ecs_task_definition.web_task.arn
  desired_count   = 2
}