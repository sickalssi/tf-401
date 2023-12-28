variable "name_prefix" {
  type        = string
  description = "Name prefix of instance'"
}

variable "environment" {
  type = string
  description = "Which environment it belongs to"
}

variable "ec2_count" {
  type        = number
  description = "Number of ec2 to be created"
}

variable "enable_ssh_key" {
  type        = bool
  description = "To create SSH key or not"
  default     = false
}