terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0779c82fbb81e731c"
    instance_type = "t3.micro"
    key_name = "congthanh-devops"

    tags = {
      Name = "demo-server"
    }
}

