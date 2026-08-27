resource "azurerm_storage_account" "scripts" {
  name                     = "stadlabscripts"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "scripts" {
  name                  = "bootstrap"
  storage_account_name  = azurerm_storage_account.scripts.name
  container_access_type = "private"
}


resource "azurerm_storage_blob" "winrm_script" {
  name                   = "winrm_bootstrap.ps1"
  storage_account_name   = azurerm_storage_account.scripts.name
  storage_container_name = azurerm_storage_container.scripts.name
  type                   = "Block"
  source                 = "${path.module}/winrm_bootstrap.ps1"
  content_md5            = filemd5("${path.module}/winrm_bootstrap.ps1")
}