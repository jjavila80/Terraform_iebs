variable "ami_id" {
  default = "ami-0820522f57700920c"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "public_subnet_1_id" {
  type = string
}

variable "public_subnet_2_id" {
  type = string
}


variable "environment" {
  type = string
}


