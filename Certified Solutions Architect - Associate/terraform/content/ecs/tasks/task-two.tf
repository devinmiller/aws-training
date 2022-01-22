resource "aws_ecs_task_definition" "sample_task_two" {
  # A unique name for your task definition
  family = "sample-task-two"

  requires_compatibilities  = ["EC2"]
  # Docker networking mode to use for the containers in the task.
  # network_mode              = "awsvpc"

  # A list of valid container definitions provided as a single valid JSON document
  container_definitions = jsonencode([
    {
      name      = "sample-task-two"
      image     = "974756476141.dkr.ecr.us-west-2.amazonaws.com/sample-registry-two:v3"
      cpu       = 128
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 8081
          hostPort = 8081
        }
      ]
      healthCheck = {
        command = [
          "CMD-SHELL",
          "curl -f http://localhost:8081 || exit 1"
        ]
        interval = 10
        timeout = 2
        retries = 2
        startPeriod = 10
      }
    }
  ])
}

resource "aws_ecs_service" "sample_task_two_service" {
  # Name of the service.
  name            = "sample-task-two-service"
  # ARN of an ECS cluster.
  cluster         = data.terraform_remote_state.cluster.outputs.cotb_dev_cluster
  # Family and revision or full ARN of the task definition that you want to run in your service.
  task_definition = aws_ecs_task_definition.sample_task_two.arn
  # Number of instances of the task definition to place and keep running.
  desired_count   = 3
  # Launch type on which to run your service.
  launch_type     = "EC2"

  # Service discovery registries for the service. 
  service_registries {
    # ARN of the Service Registry.
    registry_arn = aws_service_discovery_service.cotb_cluster_sd_service_two.arn
    # Port value
    container_port = 8081
    # Container name value
    container_name = "sample-task-two"
  }
}