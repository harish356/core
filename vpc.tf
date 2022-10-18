# vpc
resource "aws_vpc" "saivpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "saivpc"
  }
}
