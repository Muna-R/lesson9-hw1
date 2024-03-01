resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "lesson-9-hw1"
  }

}
import {
  to = aws_vpc.vpc
  id = "vpc-06dd17a83ec5ddcd1"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }

}
import {
  to = aws_internet_gateway.igw
  id = "igw-01244b438186a7ffe"
}

resource "aws_subnet" "public_subnet-1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/26"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "pub-subnet-1a"
  }

}

import {
  to = aws_subnet.public_subnet-1a
  id = "subnet-00367db61e9703d4b"
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.64/26"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"

  tags = {
    Name = "pub-subnet-1b"
  }

}
import {
  to = aws_subnet.public_subnet_1b
  id = "subnet-0de74a5bd1687c25b"
}

resource "aws_subnet" "private_subnet-1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.128/26"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1a"

  tags = {
    Name = "prive-subnet-1a"
  }

}
import {
  to = aws_subnet.private_subnet-1a
  id = "subnet-07dc38b6e4142764a"

}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.192/26"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"

  tags = {
    Name = "prive-subnet-1b"
  }

}
import {
  to = aws_subnet.private_subnet_1b
  id = "subnet-0a80e13c1c20e0460"
}



resource "aws_route_table" "public_rt_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt-table"
  }

}

import {
  to = aws_route_table.public_rt_table
  id = "rtb-03de9e403a7ac560e"
}

resource "aws_route_table_association" "assoc_public_1a" {
    subnet_id = aws_subnet.public_subnet-1a.id
    route_table_id = aws_route_table.public_rt_table.id
  
}

import {
   to = aws_route_table_association.assoc_public_1a
   id = "subnet-00367db61e9703d4b/rtb-03de9e403a7ac560e"
 }

 resource "aws_route_table_association" "assoc_public_1b" {
    subnet_id = aws_subnet.public_subnet_1b.id
    route_table_id = aws_route_table.public_rt_table.id
  
}

 import {
    to = aws_route_table_association.assoc_public_1b
    id = "subnet-0de74a5bd1687c25b/rtb-03de9e403a7ac560e"
 }

 resource "aws_route_table" "private-rt-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "private-rt-table"
  }

}

import {
  to = aws_route_table.private-rt-table
  id = "rtb-07f96595e51e0631f"
}

resource "aws_route_table_association" "assoc_priv_subnet_1a" {
    subnet_id = aws_subnet.private_subnet-1a.id
    route_table_id = aws_route_table.private-rt-table.id
  
}

import {
   to = aws_route_table_association.assoc_priv_subnet_1a
   id = "subnet-07dc38b6e4142764a/rtb-07f96595e51e0631f"
 }

 resource "aws_route_table_association" "assoc_prive_subnet_1b" {
    subnet_id = aws_subnet.private_subnet_1b.id
    route_table_id = aws_route_table.private-rt-table.id
  
}

 import {
    to = aws_route_table_association.assoc_prive_subnet_1b
    id = "subnet-0a80e13c1c20e0460/rtb-07f96595e51e0631f"
 }


