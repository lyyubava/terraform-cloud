provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      "pcor-system" = "api"
      "pcor-domain" = "cloud-runtime"
    }
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-08a0d1e16fc3f61ea" 
  instance_type = "t2.micro"

  tags = {
    Name        = "Test pcor instance"
    Environment = "Test"
    ChangeResource = "tagValue"
  }
}

