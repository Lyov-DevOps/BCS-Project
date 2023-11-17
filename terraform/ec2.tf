
provider "aws" {
  region = var.region
  #access_key = "AKIAS62GO24QKDDPC4SV"
  #secret_key = "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"
}

resource "aws_instance" "jenkins" {
  ami           = var.ami
  instance_type = var.ec2
  count = 3
  key_name = "keygen"
  subnet_id = aws_subnet.jenkins_subnet.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true


  tags= {
    Name = count.index == 0 ? "Jenkins" : "Worker${count.index}"
  }


  provisioner "local-exec" {
    command = count.index == 0 ? "echo Jenkins ansible_host=${self.public_ip} >> /home/levon/workdir/bcs/ansible/hosts" : "echo 'using jenkins instance' > /dev/null"
  }
  provisioner "local-exec" {
    command = count.index == 1 ? "echo Worker1 ansible_host=${self.public_ip} >> /home/levon/workdir/bcs/ansible/hosts" : "echo 'using jenkins instance' > /dev/null"
  }
  
  provisioner "local-exec" {
    command = count.index == 2 ? "echo Worker2 ansible_host=${self.public_ip} >> /home/levon/workdir/bcs/ansible/hosts" : "echo 'using jenkins instance' > /dev/null"
  }
  
  }
 
  

  

  




