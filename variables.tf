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
  type    = string
  default = null
}

variable "user_data_path" {
  type    = string
  default = null
}

variable "sg_ports" {
  type = list(any)
}

variable "sg_ingress_cidr_block" {
  type = list(any)
}

variable "vpc_cidr_block" {
  type    = string
  default = ""
}

variable "open-cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "subnet_cidr_block" {
  type    = string
  default = ""
}

variable "key_name" {
  type = string
}


variable "instance_name" {
  type = string
}

variable "kvpc_id" {
  type    = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}
