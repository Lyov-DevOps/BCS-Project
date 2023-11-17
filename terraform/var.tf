variable "region" {
  default     = "us-east-1"
  description = "AWS-region"
  type        = string
}

variable "ec2" {
  default = "t2.micro"
  description = "instance type"
}

variable "ami" {
  default = "ami-052efd3df9dad4825"
  type    = string
}

variable "vpc_name" {
  default = "jenkins_vpc"
  type        = string
  description = "The name of vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type = string
  
}

variable "security_group_name" {
  default = "jenkins_sg"
  type = string
}

variable "key_name" {
  default = "jenkins-key"

}

variable "worker_prefix" {
  description = "Prefix for worker instance names"
  default     = "Worker"
}
