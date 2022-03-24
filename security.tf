resource "aws_security_group" "ec2-sg" {

  name        = "sg_${var.instance_name}"
  description = "allow ec2 required rules"
  vpc_id      = aws_vpc.vpc.id


  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.sg_ingress_cidr_block
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
