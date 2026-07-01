# Diagrama
                    Internet
                        │
                ALB Security Group
                80,443 desde Internet
                        │
        ┌───────────────┴───────────────┐
        │                               │
     Node Security Group          Node Security Group
     80 desde ALB SG              80 desde ALB SG
     22 desde tu IP               22 desde tu IP
                │
                │ 27017
                ▼
        Mongo Security Group
      Solo desde Node SG