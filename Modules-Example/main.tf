module "CreateWordPressServers" {
  source          = "./EC2_WordPress_MySql"
  WordPressDBName = "WordPressSite"
}
