resource "aws_subnet" "jenkins_subnet" {
  vpc_id = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "jenkins-subnet"
  }
}