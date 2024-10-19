provider "aws" {
  region = "ap-south-1"
}

# S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "aws123-terraform-s3-bucket-demo"

  tags = {
    Name        = "TerraformS3Bucket"
    Environment = "Dev"
  }
}

# versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "TerraformVPC"
    Environment = "Dev"
  }
}

# public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name        = "PublicSubnet"
    Environment = "Dev"
  }
}

# private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name        = "PrivateSubnet"
    Environment = "Dev"
  }
}


