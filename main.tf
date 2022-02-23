resource "aws_instance" "ec2_instance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  #user_data              = file("${var.user_data_path}")
  key_name               = aws_key_pair.ec2-key-pair.key_name
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
}
