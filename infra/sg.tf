
#############################
# Web Security Group
#############################
resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "Allow SSH, HTTP, and HTTPS inbound traffic"
  vpc_id      = aws_vpc.main.id

  # SSH (restrict in production)
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # RECOMMENDED: replace with your IP, e.g., ["203.0.113.10/32"]
    # ipv6_cidr_blocks = ["::/0"] # optional IPv6; remove if not needed
  }

  # HTTP
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"] # optional
  }

  # HTTPS
  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"] # optional
  }

  # Egress: allow all outbound
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"] # optional; remove if not using IPv6
  }

  tags = {
    Name = "web_security_rules"
  }
}

#############################
# RDS Security Group
#############################
resource "aws_security_group" "rds" {
  name        = "rds-sg"
  description = "Allow MySQL access from Web SG"
  vpc_id      = aws_vpc.main.id

  # Allow MySQL only from the Web SG
  ingress {
    description     = "MySQL from Web SG"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  # Egress: allow all outbound (for DNS/NTP, etc.)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #    # ipv6_cidr_blocks = ["::/0"] # optional
  }

  tags = {
    Name = "rds_security_rules"
  }

