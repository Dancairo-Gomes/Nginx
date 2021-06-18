resource "aws_s3_bucket" "nginx" {
  bucket = "my-bucket-nginx-logs"
  acl    = "private"

  tags = {
    Name        = "my-bucket-nginx-logs"
  }
}