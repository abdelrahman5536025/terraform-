# # provider "aws" {
# #   region = "us-east-1"


# # }



# # # Create a VPC
# # resource "aws_vpc" "main" {
# #   cidr_block ="10.0.0.0/16"

# #   tags = {
# #     Name = "first-vpc"
# #   }
# # }


resource "aws_s3_bucket" "remoteee" {
  bucket = "remoteee"
  lifecycle {
    prevent_destroy = false

    }
  
  tags = {
   Name = "My buckets"

  }
}


resource "aws_s3_bucket_versioning" "backend" {
  bucket = aws_s3_bucket.remoteee.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "backend-dynamodb" {
  name           = "backend-dynamo"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket = "remoteee"
    key= "devops/terraform.tfstate"
    region="us-east-1"

    dynamodb_table = "backend-dynamo"
    encrypt = true

  }
}

