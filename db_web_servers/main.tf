#create db server
resource "aws_instance" "db" {
    ami = "ami-0323c3dd2da7fb37d"
    instance_type = "t2.micro"

    tags = {
      name = "DB"
    }
}

#create bootstrapped web server
resource "aws_instance" "web" {
    ami = "ami-0323c3dd2da7fb37d"
    instance_type = "t2.micro"
    user_data = "${file("server-script.sh")}"
    security_groups = ["${aws_security_group.allow_tls.name}"]

    tags = {
      name = "Web"
    }
}
#create elastic ip and assign to web server
resource "aws_eip" "lb" {
  instance = "${aws_instance.web.id}"
}

#create security group for web server for public access
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

    ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

output "db_ip" {
  value = "${aws_instance.db.private_ip}"
}

output "web_ip" {
  value = "${aws_eip.lb.public_ip}"
}
