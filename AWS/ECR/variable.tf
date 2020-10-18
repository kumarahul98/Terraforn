variable "REGISTERY_NAME" {
    type = string
    default = "containre-registery"
}
variable "MUTABILITY" {
    type = string
    default = "MUTABLE"
}
variable "SCAN" {
    type = bool
    default = true
}
variable "TAGS" {
  type = map(string)
  default = {}
}
variable "AWS_REGION" {
  default = "us-east-1"
}
