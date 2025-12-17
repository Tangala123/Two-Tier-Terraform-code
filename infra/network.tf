
# VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.project}-vpc"
  }
}

# Internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-igw"
  }
}

# ---------------------------------------
# Public route table (default route to IGW)
# ---------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project}-pub-rt"
  }
}

# Public subnets
resource "aws_subnet" "public" {
  count                     = var.subnet_count
  vpc_id                    = aws_vpc.main.id
  availability_zone         = local.az_names[count.index]
  cidr_block                = var.pub_cidrs[count.index]
  map_public_ip_on_launch   = true

  tags = {
    Name = "${var.project}-Pub${count.index}"
  }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# ---------------------------------------
# Private route table (no NAT route yet)
# ---------------------------------------
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-private-rt"
  }
}

# Private subnets
resource "aws_subnet" "private" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.main.id
  availability_zone       = local.az_names[count.index]
  cidr_block              = var.pri_cidrs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project}-Pri${count.index}"
  }
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
