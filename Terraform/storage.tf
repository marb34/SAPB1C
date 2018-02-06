# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${azurerm_resource_group.B1CDemo.name}"
    }

    byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "myB1storageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = "${azurerm_resource_group.B1CDemo.name}"
    location                    = "West US"
    account_tier                = "Standard"
    account_replication_type    = "LRS"

    tags {
        environment = "B1 Cloud Demo"
    }
}

resource "azurerm_managed_disk" "SB1CDisk1" {
  name = "Disk1"
  location = "West US"
  resource_group_name = "${azurerm_resource_group.B1CDemo.name}"
  storage_account_type = "Standard_LRS"
  create_option = "Empty"
  disk_size_gb = "150"

  tags {
    environment = "staging"
  }
}