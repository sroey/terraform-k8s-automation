module "primary_app" {
  source          = "./modules/web_app"
  app_name        = var.app_names.primary
  replica_count   = var.app_config.replica_count
  node_port       = var.app_config.node_port
  display_message = var.app_config.display_message
}


# BONUS: Implementing an additional stack with minimal code
module "bonus_app" {
  source          = "./modules/web_app"
  app_name        = var.app_names.bonus
  replica_count   = var.app_config.replica_count
  node_port       = var.app_config.node_port
  display_message = var.app_config.display_message
}
