variable "vpc_id" {
  type = string
}

variable "security_group_ids" {
  type = string
}

variable "db_subnet_group_name" {
  type = string
}

variable "environment" {
  type = string
}


variable "identifier" {
  default     = "mydb-rds"
  description = "Identifier for your DB"
}

variable "storage" {
  default     = "10"
  description = "Storage size in GB"
}

variable "engine" {
  default     = "mysql"
  description = "Engine type, here it is mysql"
}

variable "engine_version" {
  description = "Engine version"

  default = {
    mysql    = "8.0"
  }
}

variable "instance_class" {
  default     = "db.t3.micro"
  description = "Instance class"
}

variable "db_name" {
  default     = "myfirstdb"
  description = "db name"
}


variable "rds_username" {
  type = string
  default = "root"
}

variable "rds_passwd" {
  type = string
  default = "jjavila123"
}
