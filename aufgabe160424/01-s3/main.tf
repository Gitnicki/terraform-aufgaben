provider "aws" {
    region = "eu-central-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "tf-bucket160424"
}

