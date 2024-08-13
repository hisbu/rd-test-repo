# --------------------------------------------------------------------------
#  VPC Tag Name
# --------------------------------------------------------------------------
locals {
  tags_vpc_webapp = {
    ResourceGroup = "${var.environment[local.env]}-VPC"
    Name          = "${local.account_name}-webapp-${var.env[local.env]}-vpc"
    Purpose         = "vpc"
  }

}

resource "aws_vpc" "aws_vpc_webapp" {
  cidr_block       = var.vpc_cidr_webapp[local.env]
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = merge(local.tags, local.tags_vpc_webapp)
}
