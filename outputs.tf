output "primary_app_message" {
  value = module.primary_app.display_message
  description = "The display message for the primary (alpha) app."
}

output "bonus_app_message" {
  value = module.bonus_app.display_message
  description = "The display message for the bonus app."
}
