
output "web_app_urls" {
  description = "URLs to access web applications"
  value = {
    for key, value in var.app_configs : key => "curl http://localhost:8080/${value.name}"
  }
}

output "display_messages" {
  description = "The display messages passed to each web app module."
  value       = { for key, mod in module.web_app : key => mod.display_message }
}