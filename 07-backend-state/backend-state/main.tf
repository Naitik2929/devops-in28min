provider "aws" {
  region  = "us-east-1"
  version = "~> 2.46"
}

resource "aws_s3_bucket" "enterprise_backend_state" {
  bucket = "dev-applications-backend-state-travelbuddy-abc"
  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name        = "terraform-state"
    Environment = "dev"
  }
}
resource "aws_dynamodb_table" "enterprise_backend_lock" {
  name         = "dev_application_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}