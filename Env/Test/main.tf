module "ec2" {
  source         = "../../modules/instance"
  instance_count = 1
  name_prefix = var.name_prefix
  environment = var.environment
  enable_ssh_key = true
}
