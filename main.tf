resource "aws_instance" "instance" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.test_iam.name
  # the following forces instance to be recreated upon update of user data contents 
  user_data                   = <<EOF 
    #!/bin/bash
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd
    EOF
  user_data_replace_on_change = true 
  


  tags = {
    Name        = "${var.name_prefix}-tf-instance"
    Environment = var.environment
  }
}


# creating iam role
# creating iam instance profile
# attaching AWS managed policy to role 

resource "aws_iam_role" "test_iam" {
  name = "${var.name_prefix}-tf-ec2-ssm-role"

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
    tag-key = "{}"
  }
}

resource "aws_iam_instance_profile" "test_iam" {
  name = "${var.name_prefix}-ec2-profile"
  role = aws_iam_role.test_iam.name
}

resource "aws_iam_role_policy_attachment" "test_iam-attach" {
  role       = aws_iam_role.test_iam.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}



