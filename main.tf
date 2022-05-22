resource "aws_instance" "ec2_instance" {
  count                       = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ec2-key-pair.key_name
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_type = "gp2"
    volume_size =  var.volume_size
  }

}
