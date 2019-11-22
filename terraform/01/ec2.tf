resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-02383135f96b2293e"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-098fd4a5ffc0e66b6" ,"sg-09734e0ae6147a09b"]
  key_name  = "Devops"

  tags = { 

    Name = "ansible-node-${count.index+1}"
    
  }
}
###