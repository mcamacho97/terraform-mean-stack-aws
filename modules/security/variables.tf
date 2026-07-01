variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "allowed_ssh_ip" {
  description = "Public IP allowed to connect via SSH."
  type        = string
}