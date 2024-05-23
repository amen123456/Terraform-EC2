terraform {
  backend "s3" {
    bucket = "devopspfebucket" 
    key    = "GitHub/terraform.tfstate"
    region = "us-east-1"
  }
}
