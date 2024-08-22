provider "aws" {
  region = "us-east-1"
  # default_tags {
  #   tags = {
  #     "pcor-system" = "Test"
  #     "pcor-system" = "equipment"
  #     "pcor-domain" = "cloud-runtime"
  #   }
  # }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-08a0d1e16fc3f61ea" 
  instance_type = "t2.micro"

  tags = {
    Name        = "Test pcor instance"
    Environment = "Test"
    "pcor-system" = "invalid-system"
    "pcor-domain" = "invalid-domain"
  }
}

data "aws_instance" "filtered_instance" {
  filter {
    name   = "tag:pcor-system"
    values = ["invalid-system"]
  }
}
