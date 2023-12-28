module "ec2" {
  source    = "../../modules/instance"
  ec2_count = 2
  name_prefix = var.name_prefix
  environment = var.environment
}