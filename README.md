Terraform module thats will remove burden of creating underling infrastructure for EC2 instance

Usage Example

```hcl
module "ec2_instance" {
  source = "VahagnMian/env-ec2/aws"

  instance_count        = 3
  ami_id                = "ami-08ca3fed11864d6bb"
  instance_type         = "t2.micro"
  key_pair_path         = "./keys.public-key.pub"
  sg_ports              = [80, 443, 22]
  sg_ingress_cidr_block = ["0.0.0.0/0"]
  vpc_cidr_block        = "192.168.0.0/16"
  subnet_cidr_block     = "192.168.1.0/24"

}
