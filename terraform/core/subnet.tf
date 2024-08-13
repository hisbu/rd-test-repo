# ==========================================================================
#  Core: subnet.tf (Subnet)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Public Subnet
#    - Private Subnet
# ==========================================================================

# --------------------------------------------------------------------------
#  Subnet Tags
# --------------------------------------------------------------------------
locals {

  tags_webapp_public_subnet = {
    ResourceGroup = "${var.environment[local.env]}-PUB-WEBAPP"
  }

  tags_webapp_private_subnet = {
    ResourceGroup = "${var.environment[local.env]}-PRIV-WEBAPP"
  }

}

# --------------------------------------------------------------------------
#  Private Subnet
# --------------------------------------------------------------------------
## WEBAPP
resource "aws_subnet" "webapp_privateA" {
  vpc_id            = aws_vpc.aws_vpc_webapp.id
  cidr_block        = var.webapp_privateA[local.env]
  availability_zone = "ap-southeast-1a"

  tags = merge(local.tags, local.tags_webapp_private_subnet, { 
        Name = "${local.account_name}-webapp-${var.env[local.env]}-privateA"
        Purpose = "privateA"
        Tier = "private"
      }
    )
}

resource "aws_subnet" "webapp_privateB" {
  vpc_id            = aws_vpc.aws_vpc_webapp.id
  cidr_block        = var.webapp_privateB[local.env]
  availability_zone = "ap-southeast-1b"

  tags = merge(local.tags, local.tags_webapp_private_subnet, { 
        Name = "${local.account_name}-webapp-${var.env[local.env]}-privateB" 
        Purpose = "privateB"
        Tier = "private"
      }
    )
}

# --------------------------------------------------------------------------
#  Public Subnet
# --------------------------------------------------------------------------
# ## webapp
resource "aws_subnet" "webapp_publicA" {
  vpc_id            = aws_vpc.aws_vpc_webapp.id
  cidr_block        = var.webapp_publicA[local.env]
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_webapp_public_subnet, { 
        Name = "${local.account_name}-webapp-${var.env[local.env]}-publicA" 
        Purpose = "publicA"
        Tier = "public"
      }
    )
}

resource "aws_subnet" "webapp_publicB" {
  vpc_id            = aws_vpc.aws_vpc_webapp.id
  cidr_block        = var.webapp_publicB[local.env]
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_webapp_public_subnet, { 
        Name = "${local.account_name}-webapp-${var.env[local.env]}-publicB"
        Purpose = "publicB"
        Tier = "public" 
      }
    )
}

