# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "demoinstance" {
  ami                         = "ami-09208e69ff3feb1db"
  instance_type               = "t2.micro"
  key_name                    = "harish321"
  vpc_security_group_ids      = ["${aws_security_group.saisg.id}"]
  subnet_id                   = aws_subnet.sai_pub_sb1.id
  associate_public_ip_address = true
  user_data                   = file("ecomm.sh")
  tags = {
    Name = "My Public Instance"
  }
}

# creating 2nd EC2 instance in public subnet
resource "aws_instance" "mminstance" {
  ami                         = "ami-0267fc24ee0102728"
  instance_type               = "t2.micro"
  key_name                    = "harish321"
  vpc_security_group_ids      = ["${aws_security_group.saisg.id}"]
  subnet_id                   = aws_subnet.sai_pub_sb1.id
  associate_public_ip_address = true
  user_data                   = file("raj.sh")
  tags = {
    name = "my 2nd instance"
  }
}
