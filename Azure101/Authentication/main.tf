resource "azurerm_resource_group" "resource_gp"{
    name = "Terrform-101"
    location = "southindia"

    tags = {
        Owner = "Rahul"
    }
}