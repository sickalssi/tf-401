# output "ssh_public_ips" {
#   value = aws_instance.instance.public_ip #if you do a wildcard it will give you a list of outputs with count
# }

# output "ami_id" {
#   value = data.aws_ami.amazon_linux.id
# }

# output "ami_arn" {x
#   value = data.aws_ami.amazon_linux.arn
# }

# # ## Additional Example: Output Block
# # # output "subnets" {
# # #   value = data.aws_subnets.public.ids
# # # }
