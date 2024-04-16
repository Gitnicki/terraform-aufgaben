provider "aws" {
  region = "eu-central-1" 
}

# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name = "my-tf-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.2.0/24"]

  enable_dns_support = true
  enable_dns_hostnames = true
}

# EC2 Instance
module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_type = "t2.micro"
  name = "TF-Instance"
  ami = "ami-0f7204385566b32d0"
  subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true


  # Konfiguration für Docker und Podinfo-Container
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo service docker start
              sudo usermod -aG docker ec2-user
              sudo docker run -d -p 80:9898 stefanprodan/podinfo
              EOF
}

# SSH Inbound Security Rule 
resource "aws_security_group_rule" "ssh_inbound" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = module.vpc.default_security_group_id
  cidr_blocks = [ "0.0.0.0/0" ]
}

# HTTP Inbound Security Rule
resource "aws_security_group_rule" "http_inbound" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = module.vpc.default_security_group_id
  cidr_blocks = [ "0.0.0.0/0" ]
}

# All Outbound Security Rule
resource "aws_security_group_rule" "all_outbound" {
  type = "egress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  security_group_id = module.vpc.default_security_group_id
  cidr_blocks = [ "0.0.0.0/0" ]
}


output "public_ip" {
  value = module.ec2.public_ip
}