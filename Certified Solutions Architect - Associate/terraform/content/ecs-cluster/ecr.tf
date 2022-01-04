# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository
resource "aws_ecr_repository" "cotb_cluster_registry" {
  # Name of the repository.
  name                 = "cotb-cluster-registry"
  # The tag mutability setting for the repository.
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}