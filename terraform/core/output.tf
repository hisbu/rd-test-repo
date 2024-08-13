# ==========================================================================
#  Core: output.tf (Output Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Return value terraform module
# ==========================================================================
#VPC
output "vpc_id_webapp" {
  value = aws_vpc.aws_vpc_webapp.id
}

#PRIVATE
output "webapp_privateA" {
  value = aws_subnet.webapp_privateA.*.id
}

output "webapp_privateB" {
  value = aws_subnet.webapp_privateB.*.id
}

output "webapp_privateA_cidr" {
  value = aws_subnet.webapp_privateA.cidr_block
}

output "webapp_privateB_cidr" {
  value = aws_subnet.webapp_privateB.cidr_block
}

#PUBLIC
output "webapp_publicA" {
  value = aws_subnet.webapp_publicA.*.id
}

output "webapp_publicB" {
  value = aws_subnet.webapp_publicB.*.id
}

#SG
output "aws_security_group_ssh_private" {
  value = aws_security_group.sg[0].id
}

output "aws_security_group_ssh" {
  value = aws_security_group.sg[1].id
}