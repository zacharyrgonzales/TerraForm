#inputs are passed into the variables which triggers the resourcers to start building
variable "servers" {
  type = list(string)
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
  ami           = data.aws_ami.latest_ami.id
  instance_type = "t2.micro"
  count         = length(var.servers)

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

#output private ips
output "expected" {
  value = [for i in aws_instance.EC2_Example[*].private_ip : "IP Addr: ${i}"]
}

