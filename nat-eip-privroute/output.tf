output "id-nat" {
    value = aws_nat_gateway.main.id
  
}

output "route-table-id" {
    value = aws_route_table.nat.id
  
}