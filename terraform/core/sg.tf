resource "aws_security_group" "sg" {
  count       = length(var.sg[local.env].sg) != 0 ? length(var.sg[local.env].sg) : 0
  name        = "${local.env}-${lookup(var.sg[local.env].sg[count.index], "name")}"
  description = lookup(var.sg[local.env].sg[count.index], "description")
  vpc_id      = aws_vpc.aws_vpc_webapp.id

  dynamic "ingress" {
    for_each = lookup(var.sg[local.env].sg[count.index], "ingress")
    content {
      description = ingress.value["description"]
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.tags,
    {
      Name = "${local.env}-${lookup(var.sg[local.env].sg[count.index], "name")}"
    }
  )

}
