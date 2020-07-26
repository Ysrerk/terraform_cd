provider "aws" {
  profile = "default"
  region  = "us-east-1"
  version = "~> 2.70"
}
resource "aws_instance" "terraexample" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  //key_name = "codingbook"
  subnet_id = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags={
      Name="web_server"
  }

  //depends_on=[aws_vpc.main]

}