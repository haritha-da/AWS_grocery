provider "aws" {
  region = "eu-central-1" # or your EC2 region
}

resource "aws_s3_bucket" "avatars" {
  bucket_prefix = "grocerymate-avatars-hari"

  tags = {
    Name        = "grocerymate-avatars-hari"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "private_acl" {
  bucket = aws_s3_bucket.avatars.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.avatars.id

  versioning_configuration {
    status = "Enabled"
  }
}

