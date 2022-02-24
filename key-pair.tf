resource "aws_key_pair" "ec2-key-pair" {
  public_key = file("${var.key_pair_path}")
}
