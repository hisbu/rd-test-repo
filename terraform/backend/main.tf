locals {
  account_name = "hisbu-lab"
  env = terraform.workspace
}

provider "aws" {
  region = var.region
  # assume_role {
  #   role_arn     = var.role_arn
  #   session_name = "tf-redikru-create-vpc"
  #   external_id  = var.EXTERNAL_ID
  # }
}

# --------------------------------------------------------------------------
#  Start HERE - create s3 bucket for terraform backend
# --------------------------------------------------------------------------
resource "aws_s3_bucket" "tf-backend" {
  bucket = "tf-state-061051262837"
  
  tags = {
    Name        = "tf backend"
    Environment = terraform.workspace
  }
}

resource "aws_s3_bucket_versioning" "tf-backend-versioning" {
  bucket = aws_s3_bucket.tf-backend.id
  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.tf-backend 
  ]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf-backend-encrypt" {
  bucket = aws_s3_bucket.tf-backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }

  depends_on = [ 
    aws_s3_bucket.tf-backend,
    aws_s3_bucket_versioning.tf-backend-versioning
  ]
}