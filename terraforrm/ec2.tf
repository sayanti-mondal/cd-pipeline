#create key pair
#resource "aws_key_pair" "terra_key" {
 # key_name   = "terra-key"
  #public_key = file("~/.ssh/id_ed25519.pub")
#}

# create vpc
resource "aws_default_vpc" "default" {

}

# create security group
resource "aws_security_group" "terra_security" {
  name        = "terra_sg"
  description = "allow user to connect"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // allow traffic from any ip
  }

  egress {
    description = "allow all outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create ec2 instance
resource "aws_instance" "terra_instance" {
  #count = 2 # meta argument
   for_each = {
    web1 = "t2.micro"
    web2 = "t2.micro"
   }
  ami             = var.ami_id
  instance_type   = each.value #var.instance_type 
  key_name        = aws_key_pair.terra_key.key_name
  security_groups = [aws_security_group.terra_security.name]
  #user_data = file("${path.module}/nginx.sh")
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }
  tags = {
    #Name = "infra_server"
    Name = each.key
  }
}

#resource "aws_ec2_instance_state" "stop_instance" {
 # instance_id = aws_instance.terra_instance.id
  # state       = "running"
#}
