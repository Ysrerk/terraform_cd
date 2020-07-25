provider "aws" {
  profile = "default"
  region  = "us-east-1"
  version = "~> 2.70"
}
resource "aws_instance" "terraexample" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  tags={
      Name="web_server"
  }

  depends_on=[aws_vpc.main]

}