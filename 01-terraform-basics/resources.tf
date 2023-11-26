# STATE
# DESIRED - KNOWN - ACTUAL

# plan - execute

# This resource block defines an AWS S3 bucket.
# The bucket name is set to "my-s3-bucket-1234567891".
# Versioning is enabled for the bucket.
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket-1234567891"
  versioning {
    enabled = true
  }
}

# This resource block defines an AWS IAM user.
# The IAM user name is set to "my_iam_user".
resource "aws_iam_user" "my_iam_user" {
  name = "my_iam_user"
}
