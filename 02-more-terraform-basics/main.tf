variable "iam_user_name_prefix" {
  type    = string
  default = "my_iam_users"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.51.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_iam_users" {
  count = 3
  name  = "${var.iam_user_name_prefix}${count.index}"
}

