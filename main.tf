module "web_app" {
  for_each = var.app_configs

  source          = "./modules/web_app"
  app_name        = each.value.name
  replica_count   = each.value.replica_count
  display_message = each.value.display_message
}
