provider "aws" {
  region = "eu-west-2"
}

variable "name" {
  description = "Name the instance on deploy"
}

resource "aws_instance" "devops_01_web" {
  ami           = "ami-0e169fa5b2b2f88ae"
  instance_type = "t2.micro"
  key_name      = "devops_01"

  tags = {
    "Name" = "${var.name}"
  }
}

