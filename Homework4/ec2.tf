resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  #availability_zone = "us-east-2c"
  subnet_id = aws_subnet.main2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "HelloWorld"
  }
}



