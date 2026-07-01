output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "node_security_group_id" {
  value = aws_security_group.node.id
}

output "mongo_security_group_id" {
  value = aws_security_group.mongo.id
}
