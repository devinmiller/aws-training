# Elastic Container Service (ECS)

## What is ECS?

- Managed container orchestration service
- Create clusters to manage fleets of container deployments
- ECS manages EC2 or Fargate instances
- Schedules containers for optimal placement
- Defines rules for CPU and memory requirements
- Monitors resource utilization
- Deploy, update, and rollback containers
- Free...for real!
- Integrates with VPCs, security groups, and EBS volumes
- ELB
- CloudTrail and CloudWatch

### ECS Components

- Cluster
  - Logical collection of ECS resources - either ECS EC2 instances of Fargate instances
- Task Definition
  - Defines your application.  Similar to a Dockerfile but for running containers in ECS
- Container Definition
  - Inside a task definition, it defines the individual containers a task uses
  - Controls CPU and memory allocation and port mappings
- Task
  - Single running copy of any containers defined by a task definition
  - One working copy of an application
- Service
  - Allows task definitions to be scaled by adding tasks
  - Defines minimum and maximum values
- Registry
  - Storage for container images

### ECS Security

- EC2 Instance Role
  - Applies policy to all tasks running on that EC2 instance
- Task Role
  - Applies policy per task

## Fargate

- Serverless container engine
- Eliminates need to provision and manage servers
- Specify and pay for resources per application
- Works with both ECS and EKS
- Each workload runs in its own kernel
- Isolation and security 
- Choose EC2 instead if:
  - Compliance requirements
  - Require broader customization
  - Require GPUs

## EKS

- Elastic Kubernetes Service
- K8s is open-source software that lets you deploy and manage containerized applications at scale
- Same toolset on-premises and in cloud
- Containers are grouped in pods
- Like ECS, supports both EC2 and Fargate
- Why use EKS?
  - Already using K8s
  - Want to migrate to AWS

## ECR

- Managed Docker container registry
- Store, manage and deploy images
- Integrated with ECS and EKS
- Works with on-premises deployments
- Highly available
- Integrated wiht IAM
- Pay for storage and data transfer

## ECS + ELB

- Distribute traffic evenly across tasks in your service
- Support ALB. NLB, and CLB
- Use ALB to route HTTP/S (layer 7 traffic)
- USE NLB or CLB to route TCP (layer 4) traffic
- Supported by both EC2 and Fargate launch types
- ALB allows:
  - Dynamic host port mapping
  - Path-based routing
  - Priority rules
- ALB is recommended over NLB or CLB

## Features

## Exam Tips