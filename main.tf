module "primary_app" {
  source        = "./modules/web_app"
  app_name      = "webapp-alpha"
  replica_count = 3  # This is your "N" value
}

# BONUS: Implementing an additional stack with minimal code
module "bonus_app" {
  source        = "./modules/web_app"
  app_name      = "webapp-bonus"
  replica_count = 2
}