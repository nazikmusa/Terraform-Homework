provider aws {
    region = var.region
}
resource "aws_key_pair" "deployer" {
  key_name   = var.aws_key_pair
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}
resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main2"
  }
}

resource "aws_subnet" "main3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet3
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main3"
  }
}















