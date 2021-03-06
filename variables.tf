variable "instance_count" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair_path" {
  type = string
}

variable "user_data_path" {
  type    = string
  default = ""
}

variable "sg_ports" {
  type = list(any)
}

variable "sg_ingress_cidr_block" {
  type = list(any)
}

variable "vpc_cidr_block" {
  type = string
}

variable "open-cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "subnet_cidr_block" {
  type = string
}

variable "key_name" {
  type = string
}


variable "instance_name" {
  type = string
}

variable "elastic_ip_id" {
  type    = string
  default = ""
}

variable "volume_size" {
  type = string
}
