# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "key_pair" {
  count     = var.enable_ssh_key ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Creating Key Pair
resource "aws_key_pair" "key_pair" {
  count      = var.enable_ssh_key ? 1 : 0
  key_name   = "${var.name_prefix}-key-pair"
  public_key = tls_private_key.key_pair[0].public_key_openssh
}
# if running terraform locally, this would save the pemfile locally in the directory you run terraform
resource "local_file" "ssh_key" {
  count    = var.enable_ssh_key ? 1 : 0
  filename = "${aws_key_pair.key_pair[0].key_name}.pem"
  content  = tls_private_key.key_pair[0].private_key_pem
}