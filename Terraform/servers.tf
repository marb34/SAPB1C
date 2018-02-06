resource "azurerm_virtual_machine" "vm" {
  name                  = "B1CDemovm"
  location              = "West US"
  resource_group_name   = "${azurerm_resource_group.B1CDemo.name}"
  vm_size               = "Standard_A0"
  network_interface_ids = ["${azurerm_resource_group.B1CDemo.name}"]

  storage_os_disk {
    name              = "osdisk"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  storage_data_disk {
    name              = "datadisk"
    managed_disk_id   = "${azurerm_managed_disk.SB1CDisk1.id}"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "1023"
    create_option     = "Attach"
    lun               = 0
  }

  os_profile {
    computer_name  = "bocserver"
    #admin_username = "${var.admin_username}"
    #admin_password = "${var.admin_password}"
    admin_username = "Admin"
    admin_password = "test123"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

