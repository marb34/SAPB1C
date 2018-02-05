# Configure the Azure Provider
provider "azurerm" { }

# Create a resource group
resource "azurerm_resource_group" "B1CDemo" {
  name     = "SBOC"
  location = "West US"
}
