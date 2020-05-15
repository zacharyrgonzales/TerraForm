#Create E2 t2.micro using amazon linux image
resource "aws_instance" "webserver_ec2_example" {
  ami           = "ami-03e33c1cefd1d3d74"
  instance_type = "t2.micro"

  tags = {
    name        = "wordpress_server"
    description = "wordpress server"
  }

  depends_on = ["aws_db_instance.rdsdb"]

  #Install Wordpress and dependencies
  user_data = <<EOF
    #!/bin/bash
    yum install httpd php php-mysql -y
    cd /var/www/html
    wget https://wordpress.org/wordpress-5.1.1.tar.gz
    tar -xzf wordpress-5.1.1.tar.gz
    cp -r wordpress/* /var/www/html/
    rm -rf wordpress
    rm -rf wordpress-5.1.1.tar.gz
    chmod -R 755 wp-content
    chown -R apache:apache wp-content
    service httpd start
    chkconfig httpd on
    EOF
}

resource "aws_db_instance" "rdsdb" {
  #name of database - alpha numeric and lowercase and dashes are allowed
  name = "rdsdb1"

  #identifer of the rds instance - lowercase and dashes are allowed
  identifier          = "rdsinstance1"
  instance_class      = "db.t2.micro"
  engine              = "mysql"
  engine_version      = "8.0.17"
  username            = "bob"
  password            = "password123"
  port                = 3306
  allocated_storage   = 20
  skip_final_snapshot = true
}
