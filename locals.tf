locals {

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  names = {
    vpc     = "${var.project_name}-vpc"
    alb     = "${var.project_name}-alb"
    node1   = "${var.project_name}-node-1"
    node2   = "${var.project_name}-node-2"
    mongodb = "${var.project_name}-mongodb"
    igw     = "${var.project_name}-igw"
    nat     = "${var.project_name}-nat"
    keypair = "${var.project_name}-key"
  }

}
