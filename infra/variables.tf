
variable "region" {
  type    = string
  default = "ap-southeast-2"
}

variable "project" {
  type    = string
  default = "myapp"
}

variable "env" {
  type    = string
  default = "dev"
}

# VPC CIDR
variable "vpc_cidr" {
  type    = string
  default = "172.31.0.0/16"
}

# ✅ Availability Zones as a list of strings
variable "availability_zones" {
  type    = list(string)
  default = ["ap-southeast-2a", "ap-southeast-2b"]
}

# ✅ Public subnets as a list
variable "public_subnets" {
  type    = list(string)
  default = ["172.31.1.0/24", "172.31.2.0/24"]
}

# ✅ Private subnets as a list
variable "private_subnets" {
  type    = list(string)
  default = ["172.31.11.0/24", "172.31.12.0/24"]
}

# Compute
variable "key_name" {
  type    = string
  default = "Prasanna"
}

# Database
variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type    = string
  default = "Admin*0987654"
}
