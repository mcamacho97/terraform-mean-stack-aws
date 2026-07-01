###############################################
# Network
###############################################

output "vpc_id" {
  description = "VPC ID."

  value = module.network.vpc_id
}

###############################################
# Node 1
###############################################

output "node_1_public_ip" {
  description = "Public IP of Node 1."

  value = module.node_1.public_ip
}

output "node_1_private_ip" {
  description = "Private IP of Node 1."

  value = module.node_1.private_ip
}

###############################################
# Node 2
###############################################

output "node_2_public_ip" {
  description = "Public IP of Node 2."

  value = module.node_2.public_ip
}

output "node_2_private_ip" {
  description = "Private IP of Node 2."

  value = module.node_2.private_ip
}

###############################################
# MongoDB
###############################################

output "mongodb_private_ip" {
  description = "Private IP of MongoDB."

  value = module.mongodb.private_ip
}

###############################################
# Application Load Balancer
###############################################

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer."

  value = module.alb.dns_name
}

###############################################
# NAT Gateway
###############################################

output "nat_gateway_public_ip" {
  description = "Elastic IP associated with the NAT Gateway."

  value = module.network.nat_gateway_public_ip
}

###############################################
# SSH Key
###############################################

output "private_key_path" {
  description = "Generated SSH private key."

  value = module.keypair.private_key_path
}