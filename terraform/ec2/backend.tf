terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "tf-state-061051262837"
    # dynamodb_table = "ddb-tf-state-819037760369-ap-southeast-1"
    key            = "devops/ec2/terraform.tfstate"
    region         = "ap-southeast-1"
  }
}
