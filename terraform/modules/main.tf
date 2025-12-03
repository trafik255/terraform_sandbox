resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Project     = var.project
    Name        = var.bucket_name
    Environment = var.environment
  }
}