# STATE
# DESIRED - KNOWN - ACTUAL

output "my_s3_bucket_versioning" {
  value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}
