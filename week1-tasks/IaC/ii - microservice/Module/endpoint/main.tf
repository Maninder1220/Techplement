
resource "aws_ec2_instance_connect_endpoint" "main" {
  subnet_id        = var.private_subnet_id
  security_group_ids = [var.sg_id]

  tags = {
    Name = "${var.belongs_to}-Private-VPC-Endpoint"
  }
}