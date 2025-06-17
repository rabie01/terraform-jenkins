terraform {
  backend "s3" {
    bucket = "mybuckett21000"
    key    = "terraform/devops-project-1/terraform.tfstate"
    region = "us-east-1"
  }
}