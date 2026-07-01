variable "project_name" {
  description = "Project name used as a prefix for AWS resources."
  type        = string
}

variable "environment" {
  description = "Deployment environment (lab, dev, qa, prod)."
  type        = string
}

variable "aws_region" {
  description = "AWS region where the infrastructure will be deployed."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for Public Subnet A."
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for Public Subnet B."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the Private Subnet."
  type        = string
}

variable "availability_zone_1" {
  description = "Availability Zone for Public Subnet A."
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone for Public Subnet B."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "node_instance_count" {
  description = "Number of Node.js instances."
  type        = number
}


variable "allowed_ssh_ip" {
  description = "Public IP allowed to connect via SSH."
  type        = string
}
