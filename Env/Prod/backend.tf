terraform {
  backend "s3" {
    bucket = "sctp-ce4-tfstate-bucket"
    key    = "jody-prod.tfstate" #must be unique
    region = "ap-southeast-1"
  }
}