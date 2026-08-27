output "dc_public_ip" {
  value = azurerm_public_ip.dc_pip.ip_address
}