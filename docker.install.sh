#! /usr/bin

# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl -y
 install -m 0755 -d /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
 chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

# Install the Docker packages - latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Setup Docker as a non root-user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Install Docker compose
sudo apt-get update -y
sudo apt-get install docker-compose-plugin -y

# Verify Docker compose
docker compose version

# Config Docker to start on boot with systemd
sudo systemctl enable docker.service
sudo systemctl enable containerd.service


