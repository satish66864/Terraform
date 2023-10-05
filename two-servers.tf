provider "aws" {
  region     = "ap-south-1"
  access_key = "******************"
  secret_key = "**********************"
}

provider "aws" {
  region     = "us-east-1"
  access_key = "**********************"
  secret_key = "**************************"
  alias      = "america"
}

resource "aws_instance" "one" {
  ami               = ""
  key_name          = "mykey.pem"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1b"
  tags = {
    Name        = "first_server"
    environment = "test"
    application = "rapido"
  }
  root_block_device {
    volume_size = 20
  }
}


resource "aws_instance" "two" {
  ami               = ""
  key_name          = "mykey.pem"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  tags = {
    Name        = "second_server"
    environment = "dev"
    application = "swiggy"
  }
  root_block_device {
    volume_size = 18
  }
  provider = "america"
}

