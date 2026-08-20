output "static_web_app_url" {
  value = "https://${azurerm_static_web_app.scsi.default_host_name}"
}

output "deployment_token" {
  value = azurerm_static_web_app.scsi.api_key
  sensitive = true
}
