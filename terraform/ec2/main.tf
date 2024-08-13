locals {
  env = terraform.workspace
}

provider "aws" {
  region = var.region
}
