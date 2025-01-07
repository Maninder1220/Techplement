output "ec2_public_ip" {
  value = aws_instance.wp_sql_server.public_ip
}