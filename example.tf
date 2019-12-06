provider "aws" {
  profile = "apt_terraform"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloTerraformWorld"
  }

}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
