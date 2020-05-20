#Variable for default vpc usage - terraform does not create this, but instead "adopts" it into management
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
#inputs are passed into the variables which triggers the resourcers to start building
variable "servers" {
  type = list(string)
}

#dynamic block start
variable "ingress_rules" {
  type    = list(number)
  default = [80, 443]
}

variable "egress_rules" {
  type    = list(number)
  default = [80, 443]
}


#Get latest amazon ecs ami
data "aws_ami" "latest_ami" {
  most_recent = true
  owners      = ["591542846629"] # AWS

  filter {
    name   = "name"
    values = ["*amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


#create ec2 instances
resource "aws_instance" "EC2_Example" {
  ami                    = data.aws_ami.latest_ami.id
  instance_type          = "t2.micro"
  count                  = length(var.servers)
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  #Install apache and dependencies
  user_data = <<-EOT
    #!/bin/bash
    yum update -y
    yum install httpd -y
    service httpd start
    chkconfig httpd on
    cd /var/www/html
    echo "<html><h1>Hello! This is the *${var.servers[count.index]} Server</h1></html>" > index.html
  EOT

  tags = {
    Name = var.servers[count.index]
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_tls"
  }
}

#output private ips
output "expected" {
  value = [for i in aws_instance.EC2_Example[*] : "IP Addr: ${i.public_ip}, ${i.id}"]
}

