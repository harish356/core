# Creating External LoadBalancer
resource "aws_lb" "hs" {
  name               = "hs"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.saisg.id]
  subnets            = [aws_subnet.sai_pub_sb1.id, aws_subnet.sai_pub_sb2.id]
}
resource "aws_lb_target_group" "target" {
  name     = "hs-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.saivpc.id
}
resource "aws_lb_target_group_attachment" "hs1" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.demoinstance.id
  port             = 80
  depends_on = [
    aws_instance.demoinstance,
  ]
}
resource "aws_lb_target_group_attachment" "hs2" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.mminstance.id
  port             = 80
  depends_on = [
    aws_instance.mminstance,
  ]
}
resource "aws_lb_listener" "hs" {
  load_balancer_arn = aws_lb.hs.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}
