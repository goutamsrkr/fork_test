resource "aws_s3_bucket" "test_s3" {
  bucket = "tesrraform-test-bucket-11-09-2020"

}

output "bucket" {
  value = aws_s3_bucket.test_s3
}
