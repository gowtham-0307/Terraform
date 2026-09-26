
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

resource "aws_s3_bucket" "myS3bucket" {

    for_each = {
        dev = "my-devapp-bucket-123"
        uat = "my-uatapp-bucket-123"
        prd = "my-prdapp-bucket-123"
    }
  
    bucket = "${each.key}-${each.value}"
    acl    = "private"

    tags = {
    Name        = "MY-${each.key}-${each.value}"
    Environment = "${each.key}-TerraLearn"
    eachvalue   = each.value
    }
}
