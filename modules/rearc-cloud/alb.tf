resource "aws_lb" "application_lb" {
  name                        = "rearc-test-application-lb"
  subnets                     = var.subnet_id
  security_groups             = [aws_security_group.rearc_test.id]
  idle_timeout                = 60
  internal                    = false
  load_balancer_type          = "application"

  tags = {
    Name = "rearc-alb"
  }
}

resource "aws_lb_target_group" "application_http_3000" {
  name                 = "rearc-test-3000"
  port                 = 3000
  protocol             = "HTTP"
  deregistration_delay = 3000

  health_check {
    protocol            = "HTTP"
    interval            = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
    port                = 3000
    path                = "/"
    timeout             = 5
    matcher             = "200"
  }

  vpc_id = var.vpc_id

  tags = {
    Name = "rearc-test"
  }
}

# resource "aws_lb_listener" "app-http-3000" {
#   load_balancer_arn = aws_lb.application-lb.arn
#   port              = 3000
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.application-http-3000.arn
#   }
# }

resource "aws_lb_listener" "app_https_3000" {
  load_balancer_arn = aws_lb.application_lb.arn

  port              = 443
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-2:365290853502:certificate/a227507d-6415-4f8f-9975-9ed0d1c18d09"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_http_3000.arn
  }
}

