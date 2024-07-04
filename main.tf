provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "this" {
    tags = {
      Name        = "My bucket"
      Environment = "prod"
    }

}
resource "aws_s3_bucket" "this1" {
    tags = {
      Name        = "My this1"
      Environment = "prod"
    }
}


resource "aws_s3_bucket" "this2" {
    tags = {
      Name        = "My this1"
      Environment = "prod"
    }
    timeouts {
      create = "2s"
    }
    # depends_on = [ null_resource.sleep ]
}

resource "aws_s3_bucket" "this3" {
    tags = {
      Name        = "My this1"
      Environment = "prod"
    }
    timeouts {
      create = "1s"
    }
}

resource "aws_s3_bucket" "this4" {
    tags = {
      Name        = "My this1"
      Environment = "prod"
    }
    timeouts {
      create = "0s"
    }
}
resource "aws_instance" "this" {
    iam_instance_profile = "t2.micro"
    ami = "ami-0b0ea68c435eb488d"
    timeouts {
      create = "1s"
    }
}
output "bucket_this3" {
    value = aws_s3_bucket.this4.bucket
    
  
}
# resource "aws_s3_bucket" "already_existing_bucket" {
#     bucket = "terraform-state-aekoow9loo7voh4on5p"
#     tags = {
#       Name        = "My bucket"
#     }
#     depends_on = [ aws_s3_bucket.this, aws_s3_bucket.this1, aws_s3_bucket.this2, aws_s3_bucket.this3, aws_s3_bucket.this4 ]
#     # depends_on = [ null_resource.sleep ]
# }

# resource "null_resource" "sleep" {
#   provisioner "local-exec" {
#     command     = "sleep 60"
#     interpreter = ["bash", "-c"]

#   }
# }
# resource "aws_ssm_parameter" "dependant_resource" {
#     name = "/dependant/bucket_id"
#     value = aws_s3_bucket.already_exeisting_bucket.id
#     type = "String"
# }
