variable "users" {
  default = {
    foo = {
      department = "devops",
      country    = "india"
    },
    bar = {
      department = "devops",
      country    = "us"
    },
    baz = {
      department = "devops",
      country     = "uk"
    }
  }
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
  for_each = var.users
  name     = each.key
  tags = {
    Country = each.value.country
    department = each.value.department
  }
}