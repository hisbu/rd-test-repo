# ==========================================================================
#  Core: main.tf (Main Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - AWS Provider
#    - Common Tags
# ==========================================================================

# --------------------------------------------------------------------------
#  Provider Module Terraform
# --------------------------------------------------------------------------

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
#  Start HERE
# --------------------------------------------------------------------------
locals {
  tags = {
    Environment     = "${var.environment[local.env]}"
    Department      = "${var.department}"
    DepartmentGroup = "${var.environment[local.env]}-${var.department}"
    AWS_Solutions   = "CustomControlTowerStackSet"
    "Cost Centre"   = "111111"
    Owner           = "devops@hisbu.my.id"
  }

}
