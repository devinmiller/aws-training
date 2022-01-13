# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository
resource "aws_ecr_repository" "cotb_cluster_registry_one" {
  # Name of the repository.
  name                 = "sample-registry-one"
  # The tag mutability setting for the repository.
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

output "cotb_cluster_registry_one" {
  value = aws_ecr_repository.cotb_cluster_registry_one.repository_url
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository
resource "aws_ecr_repository" "cotb_cluster_registry_lb" {
  # Name of the repository.
  name                 = "load-balancer-registry"
  # The tag mutability setting for the repository.
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

output "cotb_cluster_registry_lb" {
  value = aws_ecr_repository.cotb_cluster_registry_lb.repository_url
}