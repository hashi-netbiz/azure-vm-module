# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
    name                  = var.vmname
    resource_group_name   = var.resource_group_name
    location              = var.location
    network_interface_ids = var.network_interface_ids
    size                  = var.vm_size
    disable_password_authentication = false  # This allows us to login using admin password. The default is true
    admin_username        = var.admin_username    
    admin_password        = var.admin_password

    os_disk {
      name                 = "${var.vmname}-os-disk-01"
      caching              = "ReadWrite"
      storage_account_type = var.os_disk_type
    }

    source_image_id = var.image_id

  # source_image_reference {
  #   publisher = var.image_publisher
  #   offer     = var.image_offer
  #   sku       = var.image_sku
  #   version   = var.image_version
  # }
}