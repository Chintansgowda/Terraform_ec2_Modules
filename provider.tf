terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
    secret_key = var.aws_secret_key
    access_key = var.aws_access_key
}