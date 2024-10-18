
provider "aws" {
  region  = "us-east-1"
  access_key = "ASIA6JQ44T4LTXWNVHUT"
  secret_key = "vmOAPCLgT9h0eRlAlj+AUqaehdha3s+OJ0euNdOZ"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "demo-bucket-tf" 
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}
