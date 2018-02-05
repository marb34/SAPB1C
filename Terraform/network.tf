# Create a virtual network within the resource group
resource "azurerm_virtual_network" "B1CDemo" {
  name                = "B1CDemo-Network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.B1CDemo.location}"
  resource_group_name = "${azurerm_resource_group.B1CDemo.name}"

  subnet {
    name           = "B1CDemo.subnet1"
    address_prefix = "10.0.1.0/26"
  }

  subnet {
    name           = "B1CDemo.subnet2"
    address_prefix = "10.0.2.0/26"
  }

  subnet {
    name           = "B1CDemo.subnet3"
    address_prefix = "10.0.3.0/26"
  }
}