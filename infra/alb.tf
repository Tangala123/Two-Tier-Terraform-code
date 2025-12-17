
# Target Group for an app
resource "aws_lb_target_group" "main" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web.id]
  subnets            = aws_subnet.public[*].id
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
# Target Group attachment
resource "aws_lb_target_group_attachment" "main" {
  count            = length(aws_instance.main.*.id)
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.main[*].id
}
