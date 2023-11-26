# STATE
# DESIRED - KNOWN - ACTUAL

# This output retrieves the status of versioning for the "my_s3_bucket" resource.
output "my_s3_bucket_versioning" {
  value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}
