#input is passed into the ec2dbname which triggers the ec2 build
variable "RDSDBName" {
  type = "string"
}

#create rds instance using mysql
resource "aws_db_instance" "moduleRdsdb" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  #the name of the database created when instance is created
  name                 = "${var.RDSDBName}" 
  username             = "acloudguru"
  password             = "acloudguru"
  parameter_group_name = "default.mysql5.7"
  #seperate security group for rds resource
  vpc_security_group_ids = ["sg-06af0c0cc80a54d19"]
}

#output private ip
output "db_name" {
  value = "${aws_db_instance.moduleRdsdb.id}"
}