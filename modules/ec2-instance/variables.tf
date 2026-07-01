variable "name" {
  description = "EC2 instance name."
  type        = string
}

variable "ami_id" {
  description = "AMI ID."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID."
  type        = string
}

variable "security_group_ids" {
  description = "Security Groups."
  type        = list(string)
}

variable "associate_public_ip" {
  description = "Associate a public IP."
  type        = bool
}

variable "key_name" {
  description = "EC2 Key Pair."
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile."
  type        = string
}

variable "user_data_file" {
  description = "Path to the user_data script."
  type        = string
}

variable "volume_size" {
  description = "Root EBS volume size."
  type        = number
  default     = 20
}