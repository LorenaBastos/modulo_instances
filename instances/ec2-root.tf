resource "aws_instance" "test-machine" {
  ami           = "ami123456754"
  instance_type = "t3.micro"

  tags = {
    Name      = "test machine for mv state"
  }
}