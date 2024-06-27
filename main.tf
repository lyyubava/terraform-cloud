provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "this" {}

# resource "aws_s3_bucket" "already_exeisting_bucket" {

# }
