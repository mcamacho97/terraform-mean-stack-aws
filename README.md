# Terraform AWS MEAN Stack

Infrastructure as Code (IaC) project developed with Terraform to deploy a highly available multi-tier architecture on AWS.

This project was created as part of a DevOps academic assignment and demonstrates Terraform best practices such as modularization, reusable infrastructure, remote state management, and automated provisioning.

📖 **Spanish version:** [README.es.md](README.es.md)

---

## Architecture

```text
                    Internet
                        │
              Application Load Balancer
                        │
          ┌─────────────┴─────────────┐
          │                           │
      EC2 Node 1                 EC2 Node 2
   Ubuntu + Node.js + Nginx   Ubuntu + Node.js + Nginx
          │                           │
          └─────────────┬─────────────┘
                        │
               EC2 MongoDB (Private)
                        │
                  NAT Gateway
                        │
                Internet Gateway
```

---

## Features

- Terraform modular architecture
- AWS VPC
- Public and private subnets
- Internet Gateway
- NAT Gateway
- Application Load Balancer
- Security Groups
- EC2 instances
- MongoDB Server
- Node.js Application
- Nginx Reverse Proxy
- IAM Role & Instance Profile
- Automatic SSH Key Pair generation
- Remote Terraform State (S3 Backend)

---

## Project Structure

```text
terraform-mean/
│
├── backend.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars
├── locals.tf
├── data.tf
├── outputs.tf
├── main.tf
│
├── modules/
│   ├── network/
│   ├── security/
│   ├── keypair/
│   ├── iam/
│   ├── ec2-instance/
│   └── alb/
│
├── userdata/
│   ├── node.sh
│   └── mongo.sh
│
└── README.md
```

---

## AWS Resources

- 1 VPC
- 2 Public Subnets
- 1 Private Subnet
- 1 Internet Gateway
- 1 NAT Gateway
- 1 Application Load Balancer
- 3 Security Groups
- 3 EC2 Instances
- 1 MongoDB Server
- 2 Node.js Servers
- IAM Role
- SSH Key Pair

---

## Prerequisites

- Terraform >= 1.12
- AWS CLI
- AWS Account
- S3 Bucket for Terraform Backend

---

## Deployment

Initialize Terraform

```bash
terraform init -backend-config=backend.hcl
```

Validate

```bash
terraform validate
```

Review execution plan

```bash
terraform plan
```

Deploy infrastructure

```bash
terraform apply
```

Destroy infrastructure

```bash
terraform destroy
```

---

## Outputs

After deployment Terraform returns:

- Node 1 Public IP
- Node 2 Public IP
- Node 1 Private IP
- Node 2 Private IP
- MongoDB Private IP
- Load Balancer DNS
- NAT Gateway Public IP

---

## Technologies

- Terraform
- AWS
- Ubuntu Server 24.04 LTS
- Node.js
- Express
- MongoDB
- Nginx

---

## Author

Mauricio Camacho

Master's Degree in DevOps Engineering