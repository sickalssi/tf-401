output "ec2_arn" {
  value = aws_instance.public[*].arn #if you do a wildcard it will give you a list of outputs with count
}