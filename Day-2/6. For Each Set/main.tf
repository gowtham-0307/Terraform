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

resource "aws_iam_user" "myuser"{
    for_each = toset(["Gowtham", "Sree", "Ravi"])
    name     = each.key
}