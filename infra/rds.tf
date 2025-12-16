resource "aws_db_subnet_group" "db" {
  name       = "rds-subnet-group"
  subnet_ids = var.sub_ids

  tags = {
    Name = "rds-subnet-group"
  }
}
# Create RDS Instance 
resource "aws_db_instance" "default" {
  allocated_storage      = var.storage
  db_name                = var.db_name
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}
