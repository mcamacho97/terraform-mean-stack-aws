# Terraform AWS MEAN Stack

Proyecto de Infraestructura como Código (IaC) desarrollado con Terraform para desplegar una arquitectura multicapa de alta disponibilidad sobre AWS.

Este proyecto fue desarrollado como parte de una actividad académica de DevOps y demuestra buenas prácticas de Terraform como modularización, reutilización de infraestructura, estado remoto y aprovisionamiento automatizado.

📖 **English version:** [README.md](README.md)

---

## Arquitectura

```text
                    Internet
                        │
              Application Load Balancer
                        │
          ┌─────────────┴─────────────┐
          │                           │
      EC2 Node 1                 EC2 Node 2
 Ubuntu + Node.js + Nginx    Ubuntu + Node.js + Nginx
          │                           │
          └─────────────┬─────────────┘
                        │
             EC2 MongoDB (Subred Privada)
                        │
                  NAT Gateway
                        │
                Internet Gateway
```

---

## Características

- Arquitectura modular con Terraform
- VPC personalizada
- Subredes públicas y privada
- Internet Gateway
- NAT Gateway
- Application Load Balancer
- Security Groups
- Instancias EC2
- MongoDB
- Aplicación Node.js
- Nginx como Reverse Proxy
- Rol IAM e Instance Profile
- Generación automática del Key Pair SSH
- Estado remoto mediante Backend S3

---

## Estructura del proyecto

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

## Recursos desplegados

- 1 VPC
- 2 Subredes públicas
- 1 Subred privada
- 1 Internet Gateway
- 1 NAT Gateway
- 1 Application Load Balancer
- 3 Security Groups
- 3 Instancias EC2
- 1 Servidor MongoDB
- 2 Servidores Node.js
- Rol IAM
- Key Pair SSH

---

## Requisitos

- Terraform >= 1.12
- AWS CLI
- Cuenta de AWS
- Bucket S3 para el Backend de Terraform

---

## Despliegue

Inicializar Terraform

```bash
terraform init -backend-config=backend.hcl
```

Validar configuración

```bash
terraform validate
```

Revisar el plan

```bash
terraform plan
```

Desplegar infraestructura

```bash
terraform apply
```

Eliminar la infraestructura

```bash
terraform destroy
```

---

## Salidas (Outputs)

Al finalizar el despliegue Terraform mostrará:

- IP pública del Nodo 1
- IP pública del Nodo 2
- IP privada del Nodo 1
- IP privada del Nodo 2
- IP privada de MongoDB
- DNS del Load Balancer
- IP pública del NAT Gateway

---

## Tecnologías

- Terraform
- AWS
- Ubuntu Server 24.04 LTS
- Node.js
- Express
- MongoDB
- Nginx

---

## Autor

Mauricio Camacho

Maestría en Ingeniería DevOps