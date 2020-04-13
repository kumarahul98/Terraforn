resource "aws_key_pair" "rahulsKey"{
	key_name = "rahulsKey"
	public_key = file(var.PUBLIC_KEY)
}

resource "aws_security_group" "terraform-sg-ssh" {
  name        = "terraform-sg-ssh"
  description = "Allow TLS inbound traffic"
 # vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
     description = "http"
     from_port = 80
     to_port = 80	
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "nginx-instance"{
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
	key_name = aws_key_pair.rahulsKey.key_name

	provisioner "file"{
		source = "script.sh"
		destination = "/tmp/script.sh"
	}
	provisioner "remote-exec"{
		inline = [
			"chmod +x /tmp/script.sh",
			"sudo /tmp/script.sh"
		]
	}
	connection{
		 host = coalesce(self.public_ip, self.private_ip)
		 type = "ssh"
		     
		user = var.INSTANCE_USERNAME
		private_key = file(var.PRIVATE_KEY)
	}
#	provisioner "local-exec" {
#		command = "echo -e 'public ip :  \e[101m ${aws_instance.nginx-instance.public_ip}' " 
#	}
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.terraform-sg-ssh.id
  network_interface_id = aws_instance.nginx-instance.primary_network_interface_id
}

output "ip"{
	value = aws_instance.nginx-instance.public_ip
}
 
