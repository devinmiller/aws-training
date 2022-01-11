# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster
resource "aws_ecs_cluster" "cotb_dev_cluster" {
  name = "cotb-dev-cluster"
} 

output "cotb_dev_cluster" {
    value = aws_ecs_cluster.cotb_dev_cluster.id
}