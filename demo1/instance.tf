resource "aws_instance" "test-var"{
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
}
