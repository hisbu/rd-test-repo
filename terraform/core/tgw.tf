# --------------------------------------------------------------------------
#  TGW
# --------------------------------------------------------------------------

# locals {
#     tags_tgw = {
#         Name = "tgw_webapp"
#         Purpose = "tgw"
#     }
#     tags_tgwAttachment = {
#         "Owner"       = "devops@hisbu.my.id"
#         "Purpose"     = "tgwAttachment"
#         "logical-id"  = "transitgatewayattachment-8bp5dz2qqefx"
#     }
# }

# resource "aws_ec2_transit_gateway_vpc_attachment" "webapp" {
#     appliance_mode_support = "disable"
#     dns_support = "enable"
#     ipv6_support = "disable"

#     subnet_ids         = [aws_subnet.webapp_privateA.id, aws_subnet.webapp_privateB.id]
#     transit_gateway_id = var.share_transit_gateway
#     vpc_id             = aws_vpc.aws_vpc_webapp.id
#     transit_gateway_default_route_table_association = true
#     transit_gateway_default_route_table_propagation = true

#     tags = merge(local.tags, local.tags_tgwAttachment, { 
#         Name = "${local.account_name}-webapp-${var.env[local.env]}-tgwAttachment" 
#       }
#     )
# }