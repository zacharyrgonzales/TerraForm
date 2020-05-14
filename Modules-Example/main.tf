module "CreateEC2WordPressResource" {
  source = "./EC2_WordPress"
  EC2Wordpressname = "WordPressSite"
}

module "CreateRDSResource" {
  source = "./RDS_MySQL"
  RDSDBName = "RDSDB"
}

