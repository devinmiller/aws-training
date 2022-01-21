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
      image     = "974756476141.dkr.ecr.us-west-2.amazonaws.com/load-balancer-registry:v4"
      cpu       = 128
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort = 80
        }
      ]
      # healthCheck = {
      #   command = [
      #     "CMD-SHELL",
      #     "curl -f http://localhost/haproxy?stats || exit 1"
      #   ]
      #   interval = 10
      #   timeout = 2
      #   retries = 2
      #   startPeriod = 10
      # }
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

resource "aws_ecs_task_definition" "sample_task_one" {
  # A unique name for your task definition
  family = "sample-task-one"

  requires_compatibilities  = ["EC2"]
  # Docker networking mode to use for the containers in the task.
  # network_mode              = "awsvpc"

  # A list of valid container definitions provided as a single valid JSON document
  container_definitions = jsonencode([
    {
      name      = "sample-task-one"
      image     = "974756476141.dkr.ecr.us-west-2.amazonaws.com/sample-registry-one:v1"
      cpu       = 128
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort = 8080
        }
      ]
      healthCheck = {
        command = [
          "CMD-SHELL",
          "curl -f http://localhost:8080 || exit 1"
        ]
        interval = 10
        timeout = 2
        retries = 2
        startPeriod = 10
      }
    }
  ])
}

resource "aws_ecs_service" "sample_task_one_service" {
  # Name of the service.
  name            = "sample-task-one-service"
  # ARN of an ECS cluster.
  cluster         = data.terraform_remote_state.cluster.outputs.cotb_dev_cluster
  # Family and revision or full ARN of the task definition that you want to run in your service.
  task_definition = aws_ecs_task_definition.sample_task_one.arn
  # Number of instances of the task definition to place and keep running.
  desired_count   = 3
  # Launch type on which to run your service.
  launch_type     = "EC2"

  # Network configuration for the service. 
  # network_configuration {
  #   # Subnets associated with the task or service.
  #   subnets = [for subnet in aws_subnet.cotb_cluster_public_subnets : subnet.id]
  #   # Security groups associated with the task or service.
  #   security_groups    = [aws_security_group.cotb_cluster_public_sg.id]
  #   # Assign a public IP address to the ENI.
  #   assign_public_ip = false
  # }

  # Service discovery registries for the service. 
  service_registries {
    # ARN of the Service Registry.
    registry_arn = aws_service_discovery_service.cotb_cluster_sd_service_one.arn
    # Port value
    container_port = 8080
    # Container name value
    container_name = "sample-task-one"
  }
}

# resource "aws_ecs_task_definition" "sample_task_two" {
#   # A unique name for your task definition
#   family = "sample-task-two"

#   requires_compatibilities  = ["EC2"]
#   # Docker networking mode to use for the containers in the task.
#   # network_mode              = "awsvpc"

#   # A list of valid container definitions provided as a single valid JSON document
#   container_definitions = jsonencode([
#     {
#       name      = "sample-task-two"
#       image     = "nginx:latest"
#       cpu       = 128
#       memory    = 256
#       essential = true
#       portMappings = [
#         {
#           containerPort = 8081
#           hostPort = 8081
#         }
#       ]
#       environment = [
#         {
#           "name" = "NGINX_PORT"
#           "value" = "8081"
#         }
#       ]
#       healthCheck = {
#         command = [
#           "CMD-SHELL",
#           "curl -f http://localhost:80 || exit 1"
#         ]
#         interval = 10
#         timeout = 2
#         retries = 2
#         startPeriod = 10
#       }
#     }
#   ])
# }

# resource "aws_ecs_service" "sample_task_two_service" {
#   # Name of the service.
#   name            = "sample-task-two-service"
#   # ARN of an ECS cluster.
#   cluster         = aws_ecs_cluster.cotb_dev_cluster.id
#   # Family and revision or full ARN of the task definition that you want to run in your service.
#   task_definition = aws_ecs_task_definition.sample_task_two.arn
#   # Number of instances of the task definition to place and keep running.
#   desired_count   = 2
#   # Launch type on which to run your service.
#   launch_type     = "EC2"

#   # Network configuration for the service. 
#   # network_configuration {
#   #   # Subnets associated with the task or service.
#   #   subnets = [for subnet in aws_subnet.cotb_cluster_public_subnets : subnet.id]
#   #   # Security groups associated with the task or service.
#   #   security_groups    = [aws_security_group.cotb_cluster_public_sg.id]
#   #   # Assign a public IP address to the ENI.
#   #   assign_public_ip = false
#   # }

#   # Service discovery registries for the service. 
#   service_registries {
#     # ARN of the Service Registry.
#     registry_arn = aws_service_discovery_service.cotb_cluster_sd_service_two.arn
#     # Port value
#     container_port = 8081
#     # Container name value
#     container_name = "sample-task-two"
#   }

#   tags = {
#     Name = "sample-task-two-service"
#     host-header = "sample-task-two.cotb.dev"
#     port = "80"
#   }
# }

# resource "aws_ecs_task_definition" "sample_task_three" {
#   # A unique name for your task definition
#   family = "sample-task-three"

#   requires_compatibilities  = ["EC2"]
#   # Docker networking mode to use for the containers in the task.
#   # network_mode              = "awsvpc"
  
#   # A list of valid container definitions provided as a single valid JSON document
#   container_definitions = jsonencode([
#     {
#       name      = "sample-task-three"
#       image     = "nginx:latest"
#       cpu       = 128
#       memory    = 256
#       essential = true
#       portMappings = [
#         {
#           containerPort = 8082
#           hostPort = 8082
#         }
#       ]
#       environment = [
#         {
#           "name" = "NGINX_PORT"
#           "value" = "8082"
#         }
#       ]
#       healthCheck = {
#         command = [
#           "CMD-SHELL",
#           "curl -f http://localhost:80 || exit 1"
#         ]
#         interval = 10
#         timeout = 2
#         retries = 2
#         startPeriod = 10
#       }
#     }
#   ])
# }

# resource "aws_ecs_service" "sample_task_three_service" {
#   # Name of the service.
#   name            = "sample-task-three-service"
#   # ARN of an ECS cluster.
#   cluster         = aws_ecs_cluster.cotb_dev_cluster.id
#   # Family and revision or full ARN of the task definition that you want to run in your service.
#   task_definition = aws_ecs_task_definition.sample_task_three.arn
#   # Number of instances of the task definition to place and keep running.
#   desired_count   = 2
#   # Launch type on which to run your service.
#   launch_type     = "EC2"

#   # Network configuration for the service. 
#   # network_configuration {
#   #   # Subnets associated with the task or service.
#   #   subnets = [for subnet in aws_subnet.cotb_cluster_public_subnets : subnet.id]
#   #   # Security groups associated with the task or service.
#   #   security_groups    = [aws_security_group.cotb_cluster_public_sg.id]
#   #   # Assign a public IP address to the ENI.
#   #   assign_public_ip = false
#   # }

#   # Service discovery registries for the service. 
#   service_registries {
#     # ARN of the Service Registry.
#     registry_arn = aws_service_discovery_service.cotb_cluster_sd_service_three.arn
#     # Port value
#     container_port = 8082
#     # Container name value
#     container_name = "sample-task-three"
#   }

#   tags = {
#     Name = "sample-task-three-service"
#     host-header = "sample-task-three.cotb.dev"
#     port = "80"
#   }
# }