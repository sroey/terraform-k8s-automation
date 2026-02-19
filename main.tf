module "primary_app" {
  source          = "./modules/web_app"
  app_name        = var.app_configs.primary.name
  replica_count   = var.app_configs.primary.replica_count
  display_message = var.app_configs.primary.display_message
  ingress_host    = "primary.web-app.local"
}


# BONUS: Implementing an additional stack with minimal code
module "bonus_app" {
  source          = "./modules/web_app"
  app_name        = var.app_configs.bonus.name
  replica_count   = var.app_configs.bonus.replica_count
  display_message = var.app_configs.bonus.display_message
  ingress_host    = "bonus.web-app.local"
}
