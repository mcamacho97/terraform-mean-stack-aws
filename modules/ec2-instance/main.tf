resource "aws_instance" "this" {

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip

  user_data                   = file(var.user_data_file)
  user_data_replace_on_change = true

  monitoring = false

  metadata_options {

    http_endpoint = "enabled"
    http_tokens   = "required"

  }

  root_block_device {

    volume_size = var.volume_size
    volume_type = "gp3"
    encrypted   = true

  }



  tags = {

    Name = var.name

  }

}
