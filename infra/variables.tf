
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

variable "vpc_cidr" {
  type    = string
  default = "172.31.0.0/16"
}

variable "az1" {
  type    = string
  default = "ap-southeast-2a"
}

variable "az2" {
  type    = string
  default = "ap-southeast-2b"
}

variable "pub1_cidr" {
  type    = string
  default = "172.31.1.0/24"
}

variable "pub2_cidr" {
  type    = string
   default = "172.31.2.0/24"
}

variable "priv1_cidr" {
  type    = string
  default = "172.31.11.0/24"
}

variable "priv2_cidr" {
  type    = string
  default = "172.31.12.0/24"
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

