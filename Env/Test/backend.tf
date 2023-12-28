terraform {
  backend "s3" {
    bucket = "sctp-ce4-tfstate-bucket"
    key    = "jody-test.tfstate" #must be unique
    region = "ap-northeast-1"
  }
}