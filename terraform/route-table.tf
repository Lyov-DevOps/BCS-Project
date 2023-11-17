resource "aws_route_table" "jenkins_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id
  route { 
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins_ig.id
  }
}

resource "aws_route_table_association" "jenkins-rtb-assoc" {
  subnet_id = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.jenkins_rt.id
}
