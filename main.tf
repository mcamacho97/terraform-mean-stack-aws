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
