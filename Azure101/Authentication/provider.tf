provider "azurerm" {
    subscription_id = var.Subscription_id 
    client_id       = var.Client_id 
    client_secret   = var.Client_secret 
    tenant_id       = var.Tenant_id 
    features {}
}