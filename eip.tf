resource "aws_eip_association" "eip_assoc" {
  count         = var.elastic_ip_id != "" ? 1 : 0
  instance_id   = aws_instance.ec2_instance[0].id
  allocation_id = var.elastic_ip_id
}
