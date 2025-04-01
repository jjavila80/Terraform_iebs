#######VPC############

resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "main_vpc"
  }
}


#######Subnets############

resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags = {
    Name = "private_subnet_2"
  }
}

#######Grupo de subnets############
resource "aws_db_subnet_group" "subn-private" {
  name        = "private_subnet_group"
  description = "Group of private subnets"
  subnet_ids  = ["${aws_subnet.private_1.id}", "${aws_subnet.private_2.id}"]
}



#######Internet Gateway############

resource "aws_internet_gateway" "demo-igw" {
  vpc_id = aws_vpc.demo-vpc.id
}


####### NAT Gateway############
resource "aws_eip" "demo-eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "demo-ngw" {
    allocation_id = aws_eip.demo-eip.id
    subnet_id = aws_subnet.public_1.id
}




#######Route Tables############

resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.demo-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.demo-igw.id
    }
    tags = {
        Name = "pub-rt"
    }
}

resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.demo-ngw.id
  }
  tags = {
    Name = "pri-rt"
  }
}

######### PUBLIC Subnet assiosation with route table    ######

resource "aws_route_table_association" "public-assoc-1"{
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "public-assoc-2"{
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.pub-rt.id
}



######### PRIVATE Subnet assiosation with route table    ######
resource "aws_route_table_association" "private-assoc-1" {
  subnet_id = aws_subnet.private_1.id
  route_table_id = aws_route_table.pri-rt.id
}

resource "aws_route_table_association" "private-assoc-2" {
  subnet_id = aws_subnet.private_2.id
  route_table_id = aws_route_table.pri-rt.id
}

