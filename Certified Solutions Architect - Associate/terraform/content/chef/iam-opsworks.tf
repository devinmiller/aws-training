# https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-servicerole.html

resource "aws_iam_role" "aws_opsworks_service_role" {
  name = "aws-opsworks-service-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "StsAssumeRole"
        Principal = {
          Service = "opsworks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "aws_opsworks_service_role_policy" {
  name = "aws-opsworks-service-role-policy"
  role = aws_iam_role.aws_opsworks_service_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
          "iam:PassRole",
          "cloudwatch:GetMetricStatistics",
          "cloudwatch:DescribeAlarms",
          "ecs:*",
          "elasticloadbalancing:*",
          "rds:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}