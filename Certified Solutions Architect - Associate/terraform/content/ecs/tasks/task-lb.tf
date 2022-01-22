resource "aws_ecs_task_definition" "load_balancer" {
  # A unique name for your task definition
  family = "load-balancer"

  requires_compatibilities  = ["EC2"]
  # Docker networking mode to use for the containers in the task.
  network_mode              = "awsvpc"

  # A list of valid container definitions provided as a single valid JSON document
  container_definitions = jsonencode([
    {
      name      = "load-balancer"
      image     = "974756476141.dkr.ecr.us-west-2.amazonaws.com/load-balancer-registry:v17"
      cpu       = 128
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort = 80
        },
        {
          containerPort = 443
          hostPort = 443
        },
        {
          containerPort = 8404
          hostPort = 8404
        }
      ]
      healthCheck = {
        command = [
          "CMD-SHELL",
          "curl -f http://localhost:8404 || exit 1"
        ]
        interval = 10
        timeout = 2
        retries = 2
        startPeriod = 10
      }
    }
  ])
}

resource "aws_ecs_service" "load_balancer_service" {
  # Name of the service.
  name            = "load-balancer-service"
  # ARN of an ECS cluster.
  cluster         = data.terraform_remote_state.cluster.outputs.cotb_dev_cluster
  # Family and revision or full ARN of the task definition that you want to run in your service.
  task_definition = aws_ecs_task_definition.load_balancer.arn
  # Number of instances of the task definition to place and keep running.
  desired_count   = 3
  # Launch type on which to run your service.
  launch_type     = "EC2"

  # Network configuration for the service. 
  network_configuration {
    # Subnets associated with the task or service.
    subnets = data.terraform_remote_state.cluster.outputs.cotb_cluster_public_subnets
    # Security groups associated with the task or service.
    security_groups    = [data.terraform_remote_state.instances.outputs.cotb_cluster_public_sg]
    # Assign a public IP address to the ENI.
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.cotb_cluster_lb_tg.arn
    container_port = "80"
    container_name = "load-balancer"
  }
}