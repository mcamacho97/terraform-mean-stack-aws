###############################################
# General Configuration
###############################################

project_name = "terraform-mean"

environment = "lab"

aws_region = "us-east-1"

###############################################
# Network Configuration
###############################################

vpc_cidr = "10.0.0.0/16"

public_subnet_1_cidr = "10.0.1.0/24"

public_subnet_2_cidr = "10.0.2.0/24"

private_subnet_cidr = "10.0.3.0/24"

availability_zone_1 = "us-east-1a"

availability_zone_2 = "us-east-1b"

###############################################
# EC2 Configuration
###############################################

instance_type = "t2.micro"

node_instance_count = 2

###############################################
# Ubuntu AMI
###############################################

ubuntu_ami_owner = "099720109477"

ubuntu_ami_name = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
