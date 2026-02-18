module "primary_app" {
  source          = "./modules/web_app"
  app_name        = var.primary_app_name
  replica_count   = var.primary_replica_count
  node_port       = var.primary_node_port
  display_message = var.primary_display_message
}


# BONUS: Implementing an additional stack with minimal code
module "bonus_app" {
  source          = "./modules/web_app"
  app_name        = var.bonus_app_name
  replica_count   = var.bonus_replica_count
  node_port       = var.bonus_node_port
  display_message = var.bonus_display_message
}
