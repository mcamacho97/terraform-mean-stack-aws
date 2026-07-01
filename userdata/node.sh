#!/bin/bash

set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "===== Updating system ====="
apt-get update
apt-get upgrade -y

echo "===== Installing dependencies ====="
apt-get install -y \
    curl \
    git \
    nginx

echo "===== Installing Node.js 22 ====="
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt-get install -y nodejs

echo "===== Creating application directory ====="
mkdir -p /opt/app
cd /opt/app

cat > package.json <<'EOF'
{
  "name": "terraform-mean-demo",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^5.1.0"
  }
}
EOF

cat > server.js <<'EOF'
const express = require("express");
const os = require("os");

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
    res.json({
        application: "Terraform MEAN Stack",
        version: "1.0.0",
        hostname: os.hostname(),
        timestamp: new Date().toISOString()
    });
});

app.get("/health", (req, res) => {
    res.status(200).json({
        status: "healthy",
        hostname: os.hostname(),
        uptime: process.uptime(),
        timestamp: new Date().toISOString()
    });
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Application listening on port ${PORT}`);
});
EOF

echo "===== Installing Node dependencies ====="
npm install

echo "===== Creating systemd service ====="

cat > /etc/systemd/system/nodeapp.service <<'EOF'
[Unit]
Description=NodeJS Application
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/app
ExecStart=/usr/bin/npm start
Restart=always
RestartSec=5
User=root
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable nodeapp
systemctl start nodeapp

echo "===== Configuring Nginx ====="

rm -f /etc/nginx/sites-enabled/default

cat > /etc/nginx/sites-available/nodeapp <<'EOF'
server {

    listen 80 default_server;

    server_name _;

    location / {

        proxy_pass http://127.0.0.1:3000;

        proxy_http_version 1.1;

        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

    }

}
EOF

ln -s /etc/nginx/sites-available/nodeapp /etc/nginx/sites-enabled/nodeapp

nginx -t

systemctl enable nginx
systemctl restart nginx

echo "===== Node server ready ====="