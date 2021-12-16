# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy
data "aws_iam_policy" "cotb_dev_lab_ecs_policy" {
  name = "AmazonEC2ContainerServiceforEC2Role"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
data "aws_iam_policy_document" "cotb_dev_lab_ec2_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "cotb_dev_lab_ecs_role" {
  # Friendly name of the role.
  name = "cotb-dev-lab-ec2-role"
  # Policy that grants an entity permission to assume the role.
  assume_role_policy = data.aws_iam_policy_document.cotb_dev_lab_ec2_policy.json
  # Set of exclusive IAM managed policy ARNs to attach to the IAM role.
  managed_policy_arns = [data.aws_iam_policy.cotb_dev_lab_ecs_policy.arn]
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile
resource "aws_iam_instance_profile" "cotb_dev_lab_ec2_ip" {
  name = "cotb-dev-lab-ec2-ip"
  role = aws_iam_role.cotb_dev_lab_ecs_role.name
}
