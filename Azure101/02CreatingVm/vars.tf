variable "Subscription_id"{
    description = "Subcription id"
} 
variable "Client_id" {
    description = "AppId"
}
variable "Client_secret" {
    description = "password"
}
variable "Tenant_id" {
    description = "tenant"
}
variable "prefix" {
    description = "name of the project"
    default = "CVm"
}
variable "sg-name"{
    description = "to store the name of the resource group"
    default = "Terrform-101"
}
variable "sg-location"{
    description = "to store the location name of the resource group"
    default = "southindia"
}