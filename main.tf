provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "this" {}

resource "aws_s3_bucket" "already_existing_bucket" {
    bucket = "terraform-state-aekoow9loo7voh4on5p"
}

# resource "aws_ssm_parameter" "dependant_resource" {
#     name = "/dependant/bucket_id"
#     value = aws_s3_bucket.already_exeisting_bucket.id
#     type = "String"
# }
