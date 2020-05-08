module "db" {
  source = "./EC2_db"
  ec2dbname = "db1"
}

module "web" {
  source = "./EC2_web"
  ec2webname = "web1"
}
