locals {

  tags_nacl_private = {
    Purpose       = "private"
    AWS_Solutions = "CustomControlTowerStackSet"

  }

  tags_nacl_public = {
    "Purpose"       = "public"
    "AWS_Solutions" = "CustomControlTowerStackSet"
  }

}


resource "aws_network_acl" "private_webapp" {
  egress {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 0
    icmp_code       = 0
    icmp_type       = 0
    protocol        = "-1"
    rule_no         = 100
    to_port         = 0
  }
  ingress {
    action          = "allow"
    cidr_block      = "10.104.32.0/24"
    from_port       = 22
    icmp_code       = 0
    icmp_type       = 0
    protocol        = "6"
    rule_no         = 121
    to_port         = 22
  }
  ingress {
    action          = "allow"
    cidr_block      = "10.104.36.0/24"
    from_port       = 22
    icmp_code       = 0
    icmp_type       = 0
    protocol        = "6"
    rule_no         = 122
    to_port         = 22
  }
  ingress {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 80
    icmp_code       = 0
    icmp_type       = 0
    protocol        = "6"
    rule_no         = 123
    to_port         = 80
  }
  ingress {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 443
    icmp_code       = 0
    icmp_type       = 0
    protocol        = "6"
    rule_no         = 124
    to_port         = 443
  }

  # owner_id   = "819037760369"
  subnet_ids = [
    aws_subnet.webapp_privateA.id,
    aws_subnet.webapp_privateB.id
  ]

  vpc_id = aws_vpc.aws_vpc_webapp.id

  tags = merge(local.tags, local.tags_nacl_private, {
    Name = "${local.account_name}-webapp-${local.env}-private"
    }
  )

}

# resource "aws_network_acl" "protected_webapp" {
  
#   egress {
#     action          = "allow"
#     cidr_block      = var.webapp_privateA[local.env]
#     from_port       = 0
#     icmp_code       = 0
#     icmp_type       = 0
#     protocol        = "-1"
#     rule_no         = 102
#     to_port         = 0
#   }
#   egress {
#     action          = "allow"
#     cidr_block      = var.webapp_privateB[local.env]
#     from_port       = 0
#     icmp_code       = 0
#     icmp_type       = 0
#     protocol        = "-1"
#     rule_no         = 103
#     to_port         = 0
#   }
#   ingress {
#     action          = "allow"
#     cidr_block      = var.webapp_privateA[local.env]
#     from_port       = 0
#     icmp_code       = 0
#     icmp_type       = 0
#     protocol        = "-1"
#     rule_no         = 102
#     to_port         = 0
#   }
#   ingress {
#     action          = "allow"
#     cidr_block      = var.webapp_privateB[local.env]
#     from_port       = 0
#     icmp_code       = 0
#     icmp_type       = 0
#     protocol        = "-1"
#     rule_no         = 103
#     to_port         = 0
#   }
#   subnet_ids = [
#     aws_subnet.webapp_protectedA.id,
#     aws_subnet.webapp_protectedB.id
#   ]
#   tags = merge(local.tags, local.tags_nacl_protected, {
#     Name = "${local.account_name}-webapp-${local.env}-protected"
#     }
#   )
#   vpc_id = aws_vpc.aws_vpc_webapp.id

# }


resource "aws_network_acl" "public_webapp" {
  egress {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 0
    icmp_code       = 0
    icmp_type       = 0
    protocol        = "-1"
    rule_no         = 100
    to_port         = 0
  }
  ingress {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 0
    icmp_code       = 0
    icmp_type       = 0
    protocol        = "-1"
    rule_no         = 100
    to_port         = 0
  }
  subnet_ids = [
    aws_subnet.webapp_publicA.id,
    aws_subnet.webapp_publicB.id,
  ]
  tags = merge(local.tags, local.tags_nacl_public, {
    Name = "${local.account_name}-webapp-${local.env}-public    "
    }
  )
  vpc_id = aws_vpc.aws_vpc_webapp.id

}
