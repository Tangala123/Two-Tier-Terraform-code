
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

variable "ec2_count" {
  default = 2
}

variable "instance_type" {
  default = "t3.micro"
}

variable "web_ingress_rules" {
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
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
