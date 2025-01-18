provider aws {
    region = "eu-central-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-nazgulya"
}

resource "aws_s3_bucket" "example2" {
  bucket = "kaizen-nazgulya2"
}

resource "aws_s3_bucket" "example3" {
  bucket = "kaizen-nazgulya3"
}

# terraform import aws_s3_bucket.example2 kaizen-nazgulya2
# terraform import aws_s3_bucket.example3 kaizen-nazgulya3