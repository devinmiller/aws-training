# https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-appsrole.html

resource "aws_iam_role" "aws_opsworks_ec2_role" {
  name = "aws-opsworks-ec2-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "aws_opsworks_ec2_profile" {
  name = "aws-opsworks-ec2-profile"
  role = aws_iam_role.aws_opsworks_ec2_role.name
}