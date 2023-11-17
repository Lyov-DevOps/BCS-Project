resource "aws_security_group" "jenkins_sg" {
  name = "allow inbound traffic"
  description = "jenkins_sg"
  vpc_id = aws_vpc.jenkins_vpc.id

  dynamic "ingress" {
    for_each = ["80","443","8080","22"]
    content {
    from_port = ingress.value
    to_port   = ingress.value
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }    
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
}
}
