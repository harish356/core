# Public Route Table
resource "aws_route_table" "saivpc_pub_rt1" {
  vpc_id = aws_vpc.saivpc.id
  tags = {
    Name = "saivpc-PUB-RT1"
  }
}
output "aws_route_table_public_ids" {
  value = aws_route_table.saivpc_pub_rt1.id
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.saivpc_pub_rt1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.saivpc_igw.id
}

# Private Route Table
# Default is private
resource "aws_route_table" "saivpc_pvt_rt1" {
  vpc_id = aws_vpc.saivpc.id
  tags = {
    Name = "saivpc-PVT-RT1"
  }
}

# Public Route Table Association
resource "aws_route_table_association" "saivpc_pub_assoc" {
  subnet_id      = aws_subnet.sai_pub_sb1.id
  route_table_id = aws_route_table.saivpc_pub_rt1.id
}

# Private Route Table Association
resource "aws_route_table_association" "saivpc_pvt_assoc" {
  subnet_id      = aws_subnet.sai_pvt_sb1.id
  route_table_id = aws_route_table.saivpc_pvt_rt1.id
}

# Public Route Table Association
resource "aws_route_table_association" "saivpc_pub_assoc1" {
  subnet_id      = aws_subnet.sai_pub_sb1.id
  route_table_id = aws_route_table.saivpc_pub_rt1.id
}

# Public Route Table Association
resource "aws_route_table_association" "saivpc_pvt_assoc1" {
  subnet_id      = aws_subnet.sai_pub_sb1.id
  route_table_id = aws_route_table.saivpc_pub_rt1.id
}

