resource "aws_lb_target_group" "obli-tg" {
  name = var.nomTG
  port = 80
  target_type = var.targType
  protocol = var.protocolo
  vpc_id = aws_vpc.obli-vpc.id
}

resource "aws_alb_target_group_attachment" "obli-tg-attachment" {
  target_group_arn = aws_lb_target_group.obli-tg.arn
  target_id = aws_instance.obli-instance.id
  port = 80
}

resource "aws_lb" "obli-lb" {
  name = var.nombLB
  internal = false
  load_balancer_type = var.tipoLB
  security_groups = [aws_security_group.obli-lb-sg.id]
  subnets = [aws_subnet.obli-private-subnet1.id, aws_subnet.obli-private-subnet2.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "obli-listener" {
  load_balancer_arn = aws_lb.obli-lb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.obli-tg.arn
  }
}

resource "aws_lb_listener_rule" "obli-listener-rule" {
  listener_arn = aws_lb_listener.obli-listener.arn
  priority = 100
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.obli-tg.arn
  }

  condition {
    path_pattern {
      values = ["/var/www/html/index.html"]
    }
  }
}
