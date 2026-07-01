#!/bin/bash

set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "===== Updating system ====="

apt-get update
apt-get upgrade -y

echo "===== Installing prerequisites ====="

apt-get install -y \
    curl \
    gnupg

echo "===== Adding MongoDB repository ====="

curl -fsSL https://pgp.mongodb.com/server-8.0.asc \
| gpg --dearmor \
-o /usr/share/keyrings/mongodb-server-8.gpg

echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-8.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" \
> /etc/apt/sources.list.d/mongodb-org-8.list

apt-get update

echo "===== Installing MongoDB ====="

apt-get install -y mongodb-org

echo "===== Configuring MongoDB ====="

sed -i 's/^  bindIp:.*/  bindIp: 0.0.0.0/' /etc/mongod.conf

systemctl enable mongod
systemctl restart mongod

echo "===== MongoDB ready ====="