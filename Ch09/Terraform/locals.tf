locals {
  redis_user_data = <<-EOF
    #!/bin/bash
    cd ~
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo service start docker
    newgrp docker
    sudo docker run -d -p 6379:6379 \
      redis:alpine
    EOF

  frontend_user_data = <<-EOF
    #!/bin/bash
    cd ~
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo service start docker 
    newgrp docker
    sudo docker run -d -p 8080:8080 \
      -e PORT=8080 \
      -e AUTH_API_ADDRESS=http://${aws_alb.alb.dns_name}:8000 \
      -e TODOS_API_ADDRESS=http://${aws_alb.alb.dns_name}:8082 \
      -e ZIPKIN_URL=http://${module.zipkin_ec2.private_ip}:9411/api/v2/spans \
      pjcb1998/devops-ramp-up-frontend:latest
    EOF

  auth_user_data = <<-EOF
    #!/bin/bash
    cd ~ 
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo service start docker 
    newgrp docker
    sudo docker run -d -p 8000:8000 \
      -e JWT_SECRET=PRFT \
      -e AUTH_API_PORT=8000 \
      -e USERS_API_ADDRESS=http://${aws_alb.alb.dns_name}:8083 \
      -e ZIPKIN_URL=http://${module.zipkin_ec2.private_ip}:9411/api/v2/spans \
      pjcb1998/devops-ramp-up-auth-api:latest
    EOF

  lmp_user_data = <<-EOF
    #!/bin/bash
    cd ~ 
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo service start docker 
    newgrp docker
    sudo docker run -d \
      -e REDIS_HOST=${module.redis_ec2.private_ip} \
      -e REDIS_PORT=6379 \
      -e REDIS_CHANNEL=log_channel \
      -e PYTHONUNBUFFERED=1 \
      -e ZIPKIN_URL=http://${module.zipkin_ec2.private_ip}:9411/api/v2/spans \
      pjcb1998/devops-ramp-up-lmp
    EOF

  todos_user_data = <<-EOF
    #!/bin/bash
    cd ~ 
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo service start docker 
    newgrp docker
    sudo docker run -d -p 8082:8082 \
      -e JWT_SECRET=PRFT \
      -e TODO_API_PORT=8082 \
      -e REDIS_HOST=${module.redis_ec2.private_ip} \
      -e REDIS_PORT=6379 \
      -e REDIS_CHANNEL=log_channel \
      -e ZIPKIN_URL=http://${module.zipkin_ec2.private_ip}:9411/api/v2/spans \
      pjcb1998/devops-ramp-up-todos-api:latest
    EOF

  users_user_data = <<-EOF
    #!/bin/bash
    cd ~ 
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo service start docker 
    newgrp docker
    sudo docker run -d -p 8083:8083 \
      -e JWT_SECRET=PRFT \
      -e SERVER_PORT=8083 \
      -e SPRING_ZIPKIN_BASE_URL=http://${module.zipkin_ec2.private_ip}:9411/ \
      pjcb1998/devops-ramp-up-users-api:latest
    EOF

  zipkin_user_data = <<-EOF
    #!/bin/bash
    cd ~ 
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo service start docker 
    newgrp docker
    sudo docker run -d -p 9411:9411 \
      openzipkin/zipkin
    EOF

  bastion_user_data = <<-EOF
    #!/bin/bash
    cd ~ 
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo service start docker 
    newgrp docker
    EOF
}
