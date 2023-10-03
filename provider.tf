provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA3QCEQ6YF733OTRV7"
  secret_key = "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"
}

resource "aws_instance" "key" {
  ami               = "ami-03d294e37a4820c21"
  key_name          = "mykey.pem"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1a"
  tags = {
    Name        = "rapo-server"
    environment = "dev"
    application = "swiggy"
  }
  root_block_device {
    volume_size = 20
  }
}

