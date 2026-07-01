# Arquitectura real:
                          Internet
                              │
                    Internet Gateway
                              │
                    Application Load Balancer
                              │
                ┌─────────────┴─────────────┐
                │                           │
        Public Subnet A             Public Subnet B
                │                           │
          EC2 Node 1                  EC2 Node 2
      Ubuntu + Node + Nginx      Ubuntu + Node + Nginx
                │                           │
                └─────────────┬─────────────┘
                              │
                      Private Subnet
                              │
                        EC2 MongoDB
                              │
                         NAT Gateway