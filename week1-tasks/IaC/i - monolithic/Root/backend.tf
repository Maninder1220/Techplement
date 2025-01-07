terraform {
  backend "s3" {
    bucket = "my-aws-terraform-backend"
    key = "terraform/state_file/Devops-User/monolithic/here"
    region = "ap-south-1"
  }
}

