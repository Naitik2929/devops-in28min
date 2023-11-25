terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.51.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_iam_users" {
    count = 3
    name = "my_iam_users_${count.index}"
}

