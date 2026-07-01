resource "tls_private_key" "this" {

  algorithm = "RSA"

  rsa_bits = 4096

}

resource "local_file" "private_key" {

  filename = "${path.root}/keys/${var.project_name}.pem"
  content  = tls_private_key.this.private_key_pem

  file_permission = "0400"

}

resource "aws_key_pair" "this" {

  key_name = "${var.project_name}-key"

  public_key = tls_private_key.this.public_key_openssh

}
