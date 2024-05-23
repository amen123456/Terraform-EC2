terraform {
  backend "s3" {
    bucket = "devopspfebucket" 
    key    = "Gitlab/terraform.tfstate"
    region = "us-east-1"
  }
}
