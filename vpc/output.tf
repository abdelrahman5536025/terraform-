output "vpc-id" {
    value = aws_vpc.vpc.id
  
}
output "pub-route-table-id" {
  value = aws_route_table.main-route-table.id
}

# output "target-group-arn" {
#   value = aws_lb_target_group.target-group.arn
# }