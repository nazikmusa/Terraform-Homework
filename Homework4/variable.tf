variable region {
    default = "us-east-2"
}

variable aws_key_pair {
  default = "deployer"
}
variable port {
  type = list
  default = [22, 80, 443]
}
variable vpc_cidr {
  default = "10.0.0.0/16"
  type = string
}
variable subnet1 {
    default = "10.0.1.0/24"
}
variable subnet2 {
    default = "10.0.2.0/24"
}
variable subnet3 {
    default = "10.0.3.0/24"
}
variable instance_type {
  default = "t2.micro"
}

variable ami {
  default = "ami-0eb070c40e6a142a3"
}

variable instance_name {
  default = "HelloWorld"
}