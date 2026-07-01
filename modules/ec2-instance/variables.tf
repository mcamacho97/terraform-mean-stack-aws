
variable "name" {
  description = "Instance name."
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

variable "key_name" {
  description = "EC2 Key Pair."
  type        = string
}

variable "user_data" {
  description = "User data script."
  type        = string
}

variable "associate_public_ip" {
  description = "Associate Public IP."
  type        = bool
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile."
  type        = string
}
