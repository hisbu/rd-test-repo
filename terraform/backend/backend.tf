# --------------------------------------------------------------------------
#  Store Path for Terraform State
# --------------------------------------------------------------------------

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "tf-state-061051262837"
    # dynamodb_table = "dd-tf-states-061051262837-ap-southeast-1"
    key            = "devops/backend/terraform.tfstate"
    region         = "ap-southeast-1"
  }
}