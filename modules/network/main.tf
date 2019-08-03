/* vpcとpublic_subnetをよしなに作る(private subnet非対応)*/
/* vpc */
resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }

  #重要なリソースは必ずこいつを
  lifecycle {
    prevent_destroy = true
  }
}

/* subnet */
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
}

resource "aws_route_table" "default" {
  vpc_id = aws_vpc.default.id
}

resource "aws_subnet" "default" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnets[count.index]["cidr_block"]
  availability_zone       = var.public_subnets[count.index]["availability_zone"]
  map_public_ip_on_launch = true
}

resource "aws_route" "default" {
  route_table_id         = aws_route_table.default.id
  gateway_id             = aws_internet_gateway.default.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "laboon_stage_route_table_association_public01" {
  count = length(aws_subnet.default)

  subnet_id      = aws_subnet.default[count.index].id
  route_table_id = aws_route_table.default.id
}

