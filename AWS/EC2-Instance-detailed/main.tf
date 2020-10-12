resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Terraform-Assignment"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Terraform-Assignment"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id                 = aws_vpc.vpc.id
  cidr_block             = "10.0.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Terraform-Assignment"
    Type = "Public"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id                 = aws_vpc.vpc.id
  cidr_block             = "10.0.1.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "Terraform-Assignment"
    Type = "Private"
  }
}

resource "aws_security_group" "sg-port22" {
  name        = "allow_ssh"
  description = "Opens port 22 from anywhere"
  vpc_id      = aws_vpc.vpc.id
  ingress  {
    description = "ssh port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Terraform-Assignment"
  }
}

resource "aws_key_pair" "kp" {
  key_name   = "Terr-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC76LBe3sXEXzD+xYKGvLalE9cs9xf+ILyWeSzzxmfDF/Hu01Wz0FEp/gWWZji3BawKRtmSJVPErnql4IQtRvN7nvcErMj09e9PX/jCuunWXPiHMkV8uLt5/xN9qUdxoUQrnrSrJiWDyyfJznD2j2s60snXMy7WlePxoJzeklyAlMoTSR9S2Yo9UK+DU+ygcOS02X5KZUU2ZF9R0DD0mexHKNCA4qrpsNC3tjx0r/9DmJk/wF54r5J8RPKYajBAhC2hc4auxiLezTEgNbx3ymi84rS/2QNtNigu9mXbT6kgBKvdMhaFECD1MxERIqwUYYjtnz9hojnoyEhqQIHx0tkv rahul@instance-1"
}
resource "aws_instance" "instance1" {
  ami                         = "ami-0947d2ba12ee1ff75"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.kp.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.sub1.id
  vpc_security_group_ids = [aws_security_group.sg-port22.id]
  tags = {
    Name = "Terraform-Assignment"
  }
}
