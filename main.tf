module "primary_app" {
  source          = "./modules/web_app"
  app_name        = "webapp-alpha"
  replica_count   = 3 # This is your "N" value
  node_port       = 30001
  display_message = "Welcome to Alpha Stack!"
}

# BONUS: Implementing an additional stack with minimal code
module "bonus_app" {
  source          = "./modules/web_app"
  app_name        = "webapp-bonus"
  replica_count   = 2
  node_port       = 30002
  display_message = "This is the Bonus Server speaking:"
}