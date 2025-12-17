resource "aws_db_subnet_group" "db" {
  name       = "${var.project}-rds-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_parameter_group" "mysql_pg" {
  name        = "${var.project}-mysql-params"
  family      = var.mysql_parameter_family
  description = "Custom params for ${var.mysql_parameter_family}"

  # Optional: add any parameters you need
  # parameters {
  #   name  = "time_zone"
  #   value = "UTC"
  # }
}

# Create RDS Instance 
resource "aws_db_instance" "default" {
  allocated_storage      = var.rds_allocated_storage_gb
  db_name                = var.db_name
  engine                 = "mysql"
  engine_version         = var.mysql_engine_version
  instance_class         = var.rds_instance_class
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = aws_db_parameter_group.mysql_pg.name
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.db.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}
