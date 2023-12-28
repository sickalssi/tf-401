variable "name_prefix" {
  type    = string
  default = "Jody"
}

variable "environment" {
  type    = string
  default = "test"
}

variable "ec2_instance_count" {
  type    = number
  default = 1
}