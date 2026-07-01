module "network" {

  source = "./modules/network"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_cidr  = var.private_subnet_cidr

  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2

}

module "security" {
  source = "./modules/security"

  project_name   = var.project_name
  vpc_id         = module.network.vpc_id
  allowed_ssh_ip = var.allowed_ssh_ip
}

module "keypair" {

  source = "./modules/keypair"

  project_name = var.project_name

}

module "iam" {

  source = "./modules/iam"

  project_name = var.project_name

}

# module "node_servers" {

#    count = var.node_instance_count

#   source = "./modules/ec2-instance"

#   name = "${var.project_name}-node-${count.index + 1}"

#   ami_id = data.aws_ami.ubuntu.id

#   instance_type = var.instance_type

#   subnet_id = count.index == 0
#     ? module.network.public_subnet_1_id
#     : module.network.public_subnet_2_id

#   security_group_ids = [
#     module.security.node_security_group_id
#   ]

#   associate_public_ip = true

#   key_name = module.keypair.key_name

#   iam_instance_profile = module.iam.instance_profile_name

#   user_data = file("${path.module}/userdata/node.sh")

# }

# module "mongodb" {

#   source = "./modules/ec2-instance"

#   name = "${var.project_name}-mongodb"

#   ami_id = data.aws_ami.ubuntu.id

#   instance_type = var.instance_type

#   subnet_id = module.network.private_subnet_id

#   security_group_ids = [
#     module.security.mongo_security_group_id
#   ]

#   associate_public_ip = false

#   key_name = module.keypair.key_name

#   iam_instance_profile = module.iam.instance_profile_name

#   user_data = file("${path.module}/userdata/mongo.sh")

# }
