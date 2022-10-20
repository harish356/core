# Public Subnet
resource "aws_subnet" "sai_pub_sb1" {
  vpc_id                  = aws_vpc.saivpc.id
  cidr_block              = "10.0.0.0/18"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "sai-PUB-SB1"
  }
}

# Public Subnet
resource "aws_subnet" "sai_pub_sb2" {
  vpc_id                  = aws_vpc.saivpc.id
  cidr_block              = "10.0.64.0/18"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "sai-PUB-SB2"
  }
}

# Private Subnet
resource "aws_subnet" "sai_pvt_sb1" {
  vpc_id                  = aws_vpc.saivpc.id
  cidr_block              = "10.0.128.0/18"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "sai-Pvt-SB1"
  }
}

# Private Subnet
resource "aws_subnet" "sai_pvt_sb2" {
  vpc_id                  = aws_vpc.saivpc.id
  cidr_block              = "10.0.192.0/18"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "sai-Pvt-SB2"
  }
}
