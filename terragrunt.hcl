generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
     region  = "eu-west-1"
     profile = "your-profile"
  }
  terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.57"
    }
}
  required_version = "~> 1.2.1"
  backend "s3" {}
  }
EOF
}

remote_state {
  backend = "s3"
  config = {
    encrypt                 = true
    bucket                  = "your-bucket"
    key                     = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table          = "your-lock-table"
    profile                 = "your-profile"
    region                  = "eu-west-1"
  }
}