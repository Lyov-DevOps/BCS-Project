resource "aws_internet_gateway" "jenkins_ig" {
  vpc_id = aws_vpc.jenkins_vpc.id
  tags = {
    Name ="jenkins_ig"
  }
}