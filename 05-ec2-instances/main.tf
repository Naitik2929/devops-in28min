# This Terraform configuration creates an AWS security group for an HTTP server.
# The security group allows incoming traffic on port 80 (TCP) and port 22 (TCP) from any IP address (0.0.0.0/0),
# and allows all outgoing traffic.
# Replace the vpc_id with the ID of your VPC.

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

resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-09b5a163cfd065a91"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    name = "http_server_sg"
  }
}