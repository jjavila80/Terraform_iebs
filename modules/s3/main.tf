# Recurso: bucket S3
resource "aws_s3_bucket" "bucket_jjavila" {
  bucket = "${var.bucket_env}-${var.bucket_name}" 
  
  tags = {
    Name        = "${var.bucket_name}"
    Environment = "${var.bucket_env}"
  }
}
