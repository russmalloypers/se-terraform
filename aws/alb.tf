resource "aws_lb_target_group" "this" {
  name     = "russ-se-challenge-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_target_group_attachment" "this" {
  count            = length(module.ec2_instance)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = module.ec2_instance[count.index].id
  port             = 80
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb" "this" {
  name               = "russ-se-challenge-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.external.id]
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]

  enable_deletion_protection = false

  tags = {
    Environment = "dev"
  }
}