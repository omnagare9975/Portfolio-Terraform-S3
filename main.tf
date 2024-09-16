resource "aws_s3_bucket" "main" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.main.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.main.id
  key    = "index.html"
  source = var.bucket_object_source # Ensure the file exists
  content_type = "text/html"
}
resource "aws_s3_object" "img" {
  bucket = aws_s3_bucket.main.id
  key    = "omsd (1).jpg"
  source = var.bucket_object_source1 # Ensure the file exists
  content_type = "image/jpeg"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.main.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.main.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.main.arn}/*"
      }
    ]
  })
}


# Data resource to get current AWS region
data "aws_region" "current" {}
