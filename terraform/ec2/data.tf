data "terraform_remote_state" "core_state" {
  backend   = "s3"
  workspace = local.env

  config = {
    bucket = "tf-state-061051262837"
    key    = "devops/core/terraform.tfstate"
    region = "ap-southeast-1"
  }
}