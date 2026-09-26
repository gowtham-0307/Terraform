terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.66.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Main VPC creation
resource "aws_vpc" "terra-vpc-1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Terra-VPC"
  }
}

# Public subnet creation
resource "aws_subnet" "terra-pubsub-1" {
  vpc_id     = aws_vpc.terra-vpc-1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Terra-Public-Subnet-1"
  }
}
# Private subnet creation
resource "aws_subnet" "terra-prisub-1" {
  vpc_id     = aws_vpc.terra-vpc-1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Terra-Private-Subnet-1"
  }
}

# S3 bucket creation
resource "aws_s3_bucket" "S3" {
  bucket = "Gowrave-Terraform-bucket-1"

  tags = {
    Name        = "Terraform-bucket-1"
    Environment = "Dev"
  }
}

