resource "aws_key_pair" "example" {
    key_name   = "terraform_key"
    public_key = file("terraform-key.pem.pub")
  
}

resource "aws_default_vpc" "example" { }

resource "aws_security_group" "example" {
    name = "terraform_security_group"
    description = "Allow SSH and HTTP access"   
    vpc_id = aws_default_vpc.example.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = "0"
        to_port = "0"
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}


resource "aws_instance" "example" {

    for_each = var.ec2_instances

    depends_on = [ aws_default_vpc.example, aws_security_group.example, aws_key_pair.example ]
    ami = var.ami_id
    instance_type = each.value
    key_name = aws_key_pair.example.key_name        
    security_groups = [aws_security_group.example.name]
    user_data = file("nginx.sh") # Script to install Nginx

    root_block_device {
      volume_size = var.root_volume_size
      volume_type = "gp2" # General Purpose SSD
    }

    tags = {
    #   Name = var.instance_name
      Name = each.key
         
    }
  
}