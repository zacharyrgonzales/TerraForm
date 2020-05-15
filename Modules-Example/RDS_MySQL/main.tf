#input is passed into the ec2name which triggers the ec2 build
variable "RDSDBName" {
  type = "string"
}

#Create RDS MySQL Instance
resource "aws_db_instance" "rdsdb" {
  #name of database - alpha numeric and lowercase and dashes are allowed
  name = "${var.RDSDBName}" #! <-- Database Name

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

  #This takes some time if true is enabled (e.g 10m+)
  multi_az = false

  #Missing code to create read replica
}
