provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
}

#Create security group with firewall rules
resource "aws_security_group" "security_grp" {
  name        = var.security_group
  description = "security group "

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = var.security_group
  }
}

resource "aws_instance" "myFirstInstance" {
  ami             = "ami-0c2b8ca1dad447f8a"
  instance_type   = var.instance_type
  security_groups = [var.security_group]
  tags = {
    Name = var.tag_name
  }
}

# Create Elastic IP address
resource "aws_eip" "myFirstInstance" {
  vpc      = true
  instance = aws_instance.myFirstInstance.id
  tags = {
    Name = "elastic_ip"
  }
}
