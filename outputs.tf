output "primary_app_message" {
  value       = module.primary_app.display_message
  description = "The display message for the primary (alpha) app."
}

output "bonus_app_message" {
  value       = module.bonus_app.display_message
  description = "The display message for the bonus app."
}


output "web_app_urls" {
  description = "URLs to access web applications"
  value = {
    primary = "curl -H 'Host: primary.web-app.local' http://localhost:8890/"
    bonus   = "curl -H 'Host: bonus.web-app.local' http://localhost:8890/"
  }
}