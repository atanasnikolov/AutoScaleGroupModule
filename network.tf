# Create a VPC ----------------------------------------------------------------
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Create 4 Subnets ------------------------------------------------------------
resource "aws_subnet" "terraform_sub1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.subnet_1_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = var.subnet_1_name
  }
}

resource "aws_subnet" "terraform_sub2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.subnet_2_cidr_block
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = var.subnet_2_name
  }
}

resource "aws_subnet" "terraform_sub3" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.subnet_3_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = var.subnet_3_name
  }
}

resource "aws_subnet" "terraform_sub4" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.subnet_4_cidr_block
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = var.subnet_4_name
  }
}

# Create a IGW ----------------------------------------------------------------
resource "aws_internet_gateway" "terraform_gateway" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = var.internet_gateway_name
  }
}

# Create 2 ElasticIP ---------------------------------------------------------
resource "aws_eip" "terraform_elip" {
  domain = "vpc"
  tags = {
    Name = var.elip_for_nat1
  }
}

resource "aws_eip" "terraform_elip2" {
  domain = "vpc"
  tags = {
    Name = var.elip_for_nat2
  }
}

# Create 2 NAT Gateway --------------------------------------------------------
resource "aws_nat_gateway" "terraform_nat" {
  allocation_id = aws_eip.terraform_elip.id
  subnet_id     = aws_subnet.terraform_sub1.id
  tags = {
    Name = var.nat_to_public_subnet1
  }
}

resource "aws_nat_gateway" "terraform_nat2" {
  allocation_id = aws_eip.terraform_elip2.id
  subnet_id     = aws_subnet.terraform_sub2.id
  tags = {
    Name = var.nat_to_public_subnet2
  }
}

# Create 4 Routing Tables -----------------------------------------------------
resource "aws_route_table" "terraform_route_gateway" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_gateway.id
  }
  tags = {
    Name = var.route_table_to_gateway_name
  }
}

resource "aws_route_table" "route_nat" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_nat.id
  }
  tags = {
    Name = var.route_from_private_subnet_to_nat1
  }
}

resource "aws_route_table" "route_nat2" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_nat2.id
  }
  tags = {
    Name = var.route_from_private_subnet_to_nat2
  }
}

# Assosiate Routing Tables ----------------------------------------------------
resource "aws_route_table_association" "terraform_associate1" {
  subnet_id      = aws_subnet.terraform_sub1.id
  route_table_id = aws_route_table.terraform_route_gateway.id
}

resource "aws_route_table_association" "terraform_associate2" {
  subnet_id      = aws_subnet.terraform_sub2.id
  route_table_id = aws_route_table.terraform_route_gateway.id
}

resource "aws_route_table_association" "terraform_associate3" {
  subnet_id      = aws_subnet.terraform_sub3.id
  route_table_id = aws_route_table.route_nat.id
}

resource "aws_route_table_association" "terraform_associate4" {
  subnet_id      = aws_subnet.terraform_sub4.id
  route_table_id = aws_route_table.route_nat2.id
}
