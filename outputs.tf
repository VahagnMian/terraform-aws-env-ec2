output "instance_vpc_id" {
  value = var.kvpc_id != "" ? var.kvpc_id : aws_vpc.vpc[0].id
}


output "instance_subnet_id" {
  value = var.subnet_id != "" ? var.subnet_id : aws_subnet.main[0].id
}
