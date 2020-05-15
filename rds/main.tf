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
