# Define a variable called "names" of type list(string) with a default value of ["foo", "bar", "baz"]
variable "names" {
  type    = list(string)
  default = ["foo", "bar", "baz"]
}

# Specify the required provider and its version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.51.0"
    }
  }
}

# Configure the AWS provider with the desired region
provider "aws" {
  region = "us-east-1"
}

# Create AWS IAM users based on the values in the "names" variable
resource "aws_iam_user" "my_iam_users" {
  # Uncomment the following lines to create IAM users for each value in the "names" variable
  #count = length(var.names)
  #name  = var.names[count.index]

  # Uncomment the following line to create IAM users for each unique value in the "names" variable
  for_each = toset(var.names)
  name     = each.value
}
