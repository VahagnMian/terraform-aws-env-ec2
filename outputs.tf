output "server_ip" {
  value = [aws_instance.ec2_instance[*].id]
}
