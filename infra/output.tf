output "security_group_id" {
  value = aws_security_group.web.id
}
output "instance_ids" {
  value = aws_instance.main.*.id
}
output "pri_sub_ids" {
  value = local.pri_sub_ids
}
output "pub_sub_ids" {
  value = local.pub_sub_ids
}
output "vpc_id" {
  value = aws_vpc.main.id
}
