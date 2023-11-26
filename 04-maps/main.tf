# Define a variable named "users" to store a map of user details.
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

# Specify the required providers for this Terraform configuration.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.51.0"
    }
  }
}

# Configure the AWS provider with the desired region.
provider "aws" {
  region = "us-east-1"
}

# Create AWS IAM users based on the values in the "users" variable.
resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key

  # Add tags to each IAM user based on the values in the "users" variable.
  tags = {
    Country    = each.value.country
    Department = each.value.department
  }
}