# Create a Security Group -----------------------------------------------------
resource "aws_security_group" "allow_http_traffic" {
  name        = var.allow_http_traffic_security_group_name
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = [var.allowed_ip_address]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Create a Security Group -----------------------------------------------------
resource "aws_security_group" "allow_filtered_traffic" {
  name        = var.allow_filtered_traffic_security_group_name
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    security_groups = [aws_security_group.allow_http_traffic.id] 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
