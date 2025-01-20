provider aws {
    region = "eu-central-1"
}

resource "aws_key_pair" "Bastion" {
  key_name   = "Bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  availability_zone = "eu-central-1a"
  subnet_id = "subnet-06caf31e6d1732fc2"
  key_name = "Bastion"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-0cdd6d7420844683b"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1b"
  subnet_id = "subnet-0ffe1ebdd6ad3101e"
  key_name = aws_key_pair.Bastion.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web3" {
  ami           = "ami-0cdd6d7420844683b"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1c"
  subnet_id = "subnet-0d64c54e7695ee474"
  key_name = aws_key_pair.Bastion.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}

output ec2 {
  value = aws_instance.web1.public_ip
  sensitive = false
}

output ami {
  value = aws_instance.web1.ami
  sensitive = false
}