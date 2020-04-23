resource "azurerm_virtual_network" "CVm1" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.sg-location
  resource_group_name = var.sg-name
}

resource "azurerm_subnet" "CVm1" {
  name                 = "${var.prefix}-internal"
  resource_group_name  = var.sg-name
  virtual_network_name = azurerm_virtual_network.CVm1.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "CVm1" {
  name                = "${var.prefix}-nic"
  location            = var.sg-location
  resource_group_name = var.sg-name

  ip_configuration {
    name                          = "${var.prefix}-internal-ip"
    subnet_id                     = azurerm_subnet.CVm1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "CVm1" {
  name                = "${var.prefix}-machine"
  resource_group_name = var.sg-name
  location            = var.sg-location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.CVm1.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("../../keys/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}