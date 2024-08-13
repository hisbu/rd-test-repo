
resource "aws_network_interface" "jumphost" {
  subnet_id   = data.terraform_remote_state.core_state.outputs.webapp_publicA[0]
  # private_ips = ["172.16.10.100"]
  security_groups = [data.terraform_remote_state.core_state.outputs.aws_security_group_ssh]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "jumphost" {
  ami                         = "ami-0adcfe5c27f7c9acf"
  instance_type               = "t2.micro"
  
  key_name                    = aws_key_pair.keypair[0].key_name
  network_interface {
    network_interface_id = aws_network_interface.jumphost.id
    device_index         = 0
  }

  tags = {
    "Name" = "jumphost-public"
  }
}

resource "aws_network_interface" "webapp" {
  subnet_id   = data.terraform_remote_state.core_state.outputs.webapp_privateA[0]
  # private_ips = ["172.16.10.100"]
  security_groups = [data.terraform_remote_state.core_state.outputs.aws_security_group_ssh_private]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "webapp" {
  ami                         = "ami-0adcfe5c27f7c9acf"
  instance_type               = "t2.micro"
  
  key_name                    = aws_key_pair.keypair[0].key_name
  network_interface {
    network_interface_id = aws_network_interface.webapp.id
    device_index         = 0
}

  tags = {
    "Name" = "webapp-1"
  }
}

