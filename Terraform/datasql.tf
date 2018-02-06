resource "azurerm_sql_server" "B1CDemo" {
  name                         = "bocsqlserver"
  resource_group_name          = "${azurerm_resource_group.B1CDemo.name}"
  location                     = "${azurerm_resource_group.B1CDemo.location}"
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  tags {
    environment = "staging"
  }
}