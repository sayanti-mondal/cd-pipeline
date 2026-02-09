resource "tls_private_key" "ssh_key" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "terra_key" {
  key_name   = "terra-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}


resource "local_file" "ansible_private_key" {
  filename        = "${path.module}/ansible_ssh_key"
  content         = tls_private_key.ssh_key.private_key_openssh
  file_permission = "0600"
}

