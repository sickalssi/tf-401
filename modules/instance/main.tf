resource "aws_instance" "public" {
  count                       = var.ec2_count
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnets.public.ids[0]
  iam_instance_profile        = aws_iam_instance_profile.example.name
  key_name                    = var.enable_ssh_key ? aws_key_pair.key_pair[0].key_name : null
  user_data                   = <<EOF
#!/bin/bash
yum install -y httpd
systemctl enable httpd
systemctl start httpd
EOF
  user_data_replace_on_change = true 
  tags = {
    Name                      = "${var.name_prefix}-${var.environment}-instance-${count.index}"
  }
}
