output "ssh_keypair" {
    value = [ for s in aws_key_pair.keypair : s.key_name ]
}

output "bation_public_ip" {
  value = aws_instance.jumphost.public_ip
}

output "webapp_private_ip" {
  value = aws_instance.webapp.private_ip
}