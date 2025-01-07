# Creating EC2 for WP-SQL Server

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


resource "aws_instance" "wp_sql_server" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ubuntu.id
  key_name = var.public_key                         
  vpc_security_group_ids = [ var.sg_id ]            
  subnet_id = var.public_subnet_id
  associate_public_ip_address = true

  # USER DATA
  user_data = <<-EOF
        #!/bin/bash
        sudo apt update && sudo apt upgrade -y
        sudo apt install php-fpm php-mysql php-curl mysql-server nginx -y
        
        EOF

  tags = {
    Name = "${var.belongs_to}-EC2"
  }

}