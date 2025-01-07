
# Route Table
output "aws_route_public_id" {
  value = aws_route.public_route.id
}




# Route Table ID
output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}


