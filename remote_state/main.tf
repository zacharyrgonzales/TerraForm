resource "aws_s3_bucket" "S3Backend" {
  bucket = "bobby-bones-s3-backend-state"

  versioning = {
    enabled = true
  }

  force_destroy = true
}
