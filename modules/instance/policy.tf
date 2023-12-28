# creating iam role
# creating iam instance profile
# attaching AWS managed policy to role 

resource "aws_iam_role" "example" {
  name = "${var.name_prefix}-ec2-ssm-role"
  
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

  tags = {
    tag-key = "jody-assume-role"
  }
}

resource "aws_iam_instance_profile" "example" {
  name = "${var.name_prefix}-ec2-profile"
  role = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "example-attach" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}