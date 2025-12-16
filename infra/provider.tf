provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket         = "web-server-bucket-dec16th-2025"       # Example: my-tfstate-bucket
    key            = "infra/terraform.tfstate"     # Path inside the bucket
    region         = "ap-southeast-2"                # Example: ap-south-1
    dynamodb_table = "terraformlock"  # Example: tf-lock-table
       encrypt        = true
  }
}

