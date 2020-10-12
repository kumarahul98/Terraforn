resource "aws_instance" "test-var" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}
/*output "ip" {
  value = aws_eip.ip.public_ip
}*/
