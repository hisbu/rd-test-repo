
# --------------------------------------------------------------------------
#  IGW Tags
# --------------------------------------------------------------------------
locals {
  tags_igw_rt_public = {
    ResourceGroup = "${var.environment[local.env]}-RT"
    Purpose       = "public"
  }

  tags_tgw_rt_privateA = {
    ResourceGroup = "${var.environment[local.env]}-RT"
    Purpose       = "privateA"
  }

  tags_tgw_rt_privateB = {
    ResourceGroup = "${var.environment[local.env]}-RT"
    Purpose       = "privateB"
  }

  tags_igw = {
    ResourceGroup = "${var.environment[local.env]}-IGW"
    Purpose       = "igw"
  }

}

# --------------------------------------------------------------------------
#  IGW
# --------------------------------------------------------------------------

resource "aws_internet_gateway" "igw_webapp" {
  vpc_id = aws_vpc.aws_vpc_webapp.id

  tags = merge(local.tags, local.tags_igw, {
    Name = "${local.account_name}-webapp-${var.env[local.env]}-igw"
    }
  )
}

# # --------------------------------------------------------------------------
# #  Route Table for IGW
# # --------------------------------------------------------------------------

resource "aws_route_table" "igw_public_webapp" {
  vpc_id = aws_vpc.aws_vpc_webapp.id
  route {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw_webapp.id
    }

  tags = merge(local.tags, local.tags_igw_rt_public, {
    Name = "${local.account_name}-webapp-${var.env[local.env]}-public"
    }
  )
}

# #route table association
# #public
resource "aws_route_table_association" "webapp_publicA" {
  subnet_id      = aws_subnet.webapp_publicA.id
  route_table_id = aws_route_table.igw_public_webapp.id
}


resource "aws_route_table_association" "webapp_publicB" {
  subnet_id      = aws_subnet.webapp_publicB.id
  route_table_id = aws_route_table.igw_public_webapp.id
}

# #private
# resource "aws_route_table_association" "webapp_privateA" {
#   subnet_id      = aws_subnet.webapp_privateA.id
#   route_table_id = aws_route_table.tgw_privateA_webapp.id
# }

# resource "aws_route_table_association" "webapp_privateB" {
#   subnet_id      = aws_subnet.webapp_privateB.id
#   route_table_id = aws_route_table.tgw_privateB_webapp.id
# }

# resource "aws_route_table_association" "webapp_protectedA" {
#   subnet_id      = aws_subnet.webapp_protectedA.id
#   route_table_id = aws_route_table.tgw_protected_webapp.id
# }

# resource "aws_route_table_association" "webapp_protectedB" {
#   subnet_id      = aws_subnet.webapp_protectedB.id
#   route_table_id = aws_route_table.tgw_protected_webapp.id
# }
