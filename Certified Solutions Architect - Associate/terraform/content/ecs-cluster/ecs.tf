# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster
# resource "aws_ecs_cluster" "cotb_dev_cluster" {
#   name = "cotb-dev-cluster"
# } 

# resource "aws_ecs_task_definition" "sample_task_one" {
#   # A unique name for your task definition
#   family = "sample-task-one"

#   requires_compatibilities  = ["EC2"]
#   # Docker networking mode to use for the containers in the task.
#   network_mode              = "awsvpc"

#   deployment_maximum_percent = 100


#   # A list of valid container definitions provided as a single valid JSON document
#   container_definitions = jsonencode([
#     {
#       name      = "sample-task-one"
#       image     = "nginx:latest"
#       cpu       = 128
#       memory    = 256
#       essential = true
#       portMappings = [
#         {
#           containerPort = 80
#           hostPort      = 80
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

# resource "aws_ecs_service" "sample_task_one_service" {
#   # Name of the service.
#   name            = "sample-task-one-service"
#   # ARN of an ECS cluster.
#   cluster         = aws_ecs_cluster.cotb_dev_cluster.id
#   # Family and revision or full ARN of the task definition that you want to run in your service.
#   task_definition = aws_ecs_task_definition.sample_task_one.arn
#   # Number of instances of the task definition to place and keep running.
#   desired_count   = 2
#   # Launch type on which to run your service.
#   launch_type     = "EC2"

#   # Network configuration for the service. 
#   network_configuration {
#     # Subnets associated with the task or service.
#     subnets = [for subnet in aws_subnet.cotb_cluster_public_subnets : subnet.id]
#     # Security groups associated with the task or service.
#     security_groups    = [aws_security_group.cotb_cluster_public_sg.id]
#     # Assign a public IP address to the ENI.
#     assign_public_ip = false
#   }

#   # Service discovery registries for the service. 
#   service_registries {
#     # ARN of the Service Registry.
#     registry_arn = aws_service_discovery_service.cotb_cluster_sd_service.arn
#     # Port value, already specified in the task definition, to be used for your service discovery service.
#     # container_port = 80
#     # Container name value, already specified in the task definition, to be used for your service discovery service.
#     # container_name = "sample-task-one"
#   }

#   tags = {
#     Name = "sample-task-one-service"
#     host-header = "sample-task-one.cotb.dev"
#     port = "80"
#   }
# }

# resource "aws_ecs_task_definition" "sample_task_two" {
#   # A unique name for your task definition
#   family = "sample-task-two"

#   requires_compatibilities  = ["EC2"]
#   # Docker networking mode to use for the containers in the task.
#   network_mode              = "awsvpc"
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
#           containerPort = 80
#           hostPort      = 80
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
#   network_configuration {
#     # Subnets associated with the task or service.
#     subnets = [for subnet in aws_subnet.cotb_cluster_public_subnets : subnet.id]
#     # Security groups associated with the task or service.
#     security_groups    = [aws_security_group.cotb_cluster_public_sg.id]
#     # Assign a public IP address to the ENI.
#     assign_public_ip = false
#   }

#   # Service discovery registries for the service. 
#   service_registries {
#     # ARN of the Service Registry.
#     registry_arn = aws_service_discovery_service.cotb_cluster_sd_service.arn
#     # Port value, already specified in the task definition, to be used for your service discovery service.
#     # container_port = 80
#     # Container name value, already specified in the task definition, to be used for your service discovery service.
#     # container_name = "sample-task-one"
#   }

#   tags = {
#     Name = "sample-task-two-service"
#     host-header = "sample-task-two.cotb.dev"
#     port = "80"
#   }
# }