# Internet Gateway
resource "aws_internet_gateway" "saivpc_igw" {
  vpc_id = aws_vpc.saivpc.id
  tags = {
    Name = "saivpc-IGW"
  }
}
