variable "project_name" {
  description = "Project name."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC."
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block of the first public subnet."
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block of the second public subnet."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block of the private subnet."
  type        = string
}

variable "availability_zone_1" {
  description = "First Availability Zone."
  type        = string
}

variable "availability_zone_2" {
  description = "Second Availability Zone."
  type        = string
}
