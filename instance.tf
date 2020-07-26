provider "aws" {
  profile = "default"
  region  = "us-east-1"
  version = "~> 2.70"
}
resource "aws_instance" "terraexample" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "codysrKey"
  subnet_id = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags={
      Name="web_server"
  }

  
connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host = self.public_ip
 }
provisioner "remote-exec" {
     inline = [
        "sudo apt update",
        "sudo apt install nginx -y",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
   ]
 }
 

}