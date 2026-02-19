module "primary_app" {
  source          = "./modules/web_app"
  app_name        = var.app_configs.primary.name
  replica_count   = var.app_configs.primary.replica_count
  node_port       = var.app_configs.primary.node_port
  display_message = var.app_configs.primary.display_message
}


# BONUS: Implementing an additional stack with minimal code
module "bonus_app" {
  source          = "./modules/web_app"
  app_name        = var.app_configs.bonus.name
  replica_count   = var.app_configs.bonus.replica_count
  node_port       = var.app_configs.bonus.node_port
  display_message = var.app_configs.bonus.display_message
}
