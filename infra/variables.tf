
variable "region" {
  type    = string
  default = "ap-southeast-2"
}

variable "project" {
  type    = string
  default = "myapp"
}

variable "subnet_count" {
  default = 2
}

# VPC CIDR
variable "vpc_cidr" {
  type    = string
  default = "172.31.0.0/16"
}

# ✅ Public subnets as a list
variable "pub_cidrs" {
  type    = list(string)
  default = ["172.31.1.0/24", "172.31.2.0/24"]
}

# ✅ Private subnets as a list
variable "pri_cidrs" {
  type    = list(string)
  default = ["172.31.11.0/24", "172.31.12.0/24"]
}

# Compute
variable "tg_name" {
  type    = string
  default = "myapp-tg"
}

variable "tg_port" {
  type    = string
  default = "80"
}

variable "tg_protocol" {
  type    = string
  default = "HTTP"
}

variable "alb_name" {
  type    = string
  default = "myapp-alb"
}
variable "key_name" {
  type    = string
  default = "Prasanna"
}

variable "ec2_count" {
  default = 2
}

variable "instance_type" {
  default = "t3.micro"
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

variable "mysql_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "myappdb"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage_gb" {
  description = "RDS storage size in GB"
  type        = number
  default     = 20
}
