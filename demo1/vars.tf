variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION"{
	default = "us-east-1"
}
variable "AMIS" {
	type = map
	default = {
	us-east-1 = "ami-039a49e70ea773ffc"
	us-east-2 = "ami-03ffa9b61e8d2cfda"
	}
}
