variable "aws_region" {
  default = "eu-central-1"
}

variable "profile" {
  default = "default"
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of existing AWS key pair"
  type        = string
}

variable "instance_name" {
  default = "TerraformAppServer"
}

variable "db_name" {
  default = "mydb"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "RDS password"
  type        = string
  sensitive   = true
}

