                 Internet
                     │
               Application Load Balancer
                     │
             Target Group (HTTP:80)
              /                  \
             /                    \
      Node 1 (80)           Node 2 (80)
             │                    │
        Nginx → Node.js      Nginx → Node.js