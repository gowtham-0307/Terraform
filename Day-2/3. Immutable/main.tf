terraform{
  required_version = "1.16.4"
  required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }  
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "Mumbai-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Mumbai-VPC"
  }
}