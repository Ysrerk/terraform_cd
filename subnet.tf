resource "aws_subnet" "public_subnet" {
  vpc_id     = "vpc-0c34f39c64fdd2a4a"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet"
  }
}