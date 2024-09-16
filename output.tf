output "static_url" {
   value = "http://${aws_s3_bucket.main.bucket}.s3-website.${data.aws_region.current.name}.amazonaws.com"
}