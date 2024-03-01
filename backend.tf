terraform {
  backend "s3" {
    bucket = "tf-backend-muna"
    region = "us-east-1"
    key    = "lesson-9-hw1"

  }
}