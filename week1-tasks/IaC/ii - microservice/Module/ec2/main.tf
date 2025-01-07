# Creating EC2 for WP n SQL Server

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "ec2" {
  count = 2

  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [var.sg_id]

  key_name = var.public_key

  subnet_id = count.index == 0 ? var.public_subnet_id : var.private_subnet_id

  associate_public_ip_address = count.index == 0 ? true : false

  user_data = count.index == 0 ? local.public_user_data : local.private_user_data

  tags = {
    Name = count.index == 0 ? "WP-EC2" : "SQL-EC2"
  }
}


locals {
  public_user_data = <<-EOF
    #!/bin/bash
    sudo apt update && sudo apt upgrade -y
    sudo apt install php-fpm php-mysql php-curl mysql-server nginx -y

    cd /var/www/html
    sudo wget https://wordpress.org/latest.tar.gz
    sudo tar -xvzf latest.tar.gz
    sudo mv wordpress/* .
    sudo rm -rf wordpress latest.tar.gz

    sudo chown -R www-data:www-data /var/www/html
    sudo chmod -R 755 /var/www/html

    sudo apt update && sudo apt upgrade -y

    EOF

  private_user_data = <<-EOF
    #!/bin/bash
    sudo apt update && sudo apt upgrade -y
    sudo apt install mysql-server -y
    EOF
}