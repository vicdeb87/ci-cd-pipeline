# create ALB
resource "aws_lb" "alb1" {
  name                       = "alb-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg2.id]
  subnets                    = module.vpc.public_subnets
  enable_deletion_protection = false
}
# create listner
resource "aws_lb_listener" "listner1" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }

}