resource "aws_instance" "ec2_instance" {
  count                       = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ec2-key-pair.key_name
  subnet_id                   = var.subnet_id != "" ? var.subnet_id : aws_subnet.main[0].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  #user_data              = file("${var.user_data_path}")
  tags = {
    Name = var.instance_name
  }
}
