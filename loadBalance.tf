
# Create a Load Balancer ------------------------------------------------------
resource "aws_lb" "load_balancer_for_autoscale" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_traffic.id]
  subnets            = [aws_subnet.terraform_sub1.id, aws_subnet.terraform_sub2.id]

  enable_deletion_protection = false
}

# Create a Load Balancer Target Group -----------------------------------------

resource "aws_lb_target_group" "alb_target" {
  name        = var.load_balancer_targets_group_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.terraform_vpc.id
}

# Create a Load Balancer Listener ---------------------------------------------
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load_balancer_for_autoscale.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target.arn
  }
  tags = {
    Name = var.load_balancer_listener_name
  }
}
