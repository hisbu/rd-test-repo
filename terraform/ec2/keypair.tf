resource "aws_key_pair" "keypair" {
  count = length(var.keypair)

  key_name   = "${lookup(var.keypair[count.index], "name")}-${var.env[local.env]}"
  public_key = lookup(var.keypair[count.index], "public_key")

  tags = merge(
    {
      Name = "${lookup(var.keypair[count.index], "name")}"
    }
  )

  lifecycle {
    ignore_changes = [
        tags,
        key_name,
        public_key
    ]
  }

}
