# Setup our aws provider
provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region = "${var.region}"
}

# Define a vpc
resource "aws_vpc" "vpc_name" {
  cidr_block = "${var.vpc_cidr_block}"
  tags {
    Name = "${var.vpc_name}"
  }
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc_name.id}"
  tags {
    Name = "ig"
  }
}

# Public subnet
resource "aws_subnet" "vpc_public_sn_1" {
  vpc_id = "${aws_vpc.vpc_name.id}"
  cidr_block = "${var.vpc_public_subnet_1_cidr}"
  availability_zone = "${lookup(var.availability_zone, var.region)}"
  tags {
    Name = "vpc_public_sn_1"
  }
}

# Routing table for public subnet
resource "aws_route_table" "vpc_public_sn_rt_1" {
  vpc_id = "${aws_vpc.vpc_name.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }
  tags {
    Name = "vpc_public_sn_rt_1"
  }
}

# Associate the routing table to public subnet
resource "aws_route_table_association" "vpc_public_sn_rt_assn_1" {
  subnet_id = "${aws_subnet.vpc_public_sn_1.id}"
  route_table_id = "${aws_route_table.vpc_public_sn_rt_1.id}"
}

# Public subnet
resource "aws_subnet" "vpc_public_sn_2" {
  vpc_id = "${aws_vpc.vpc_name.id}"
  cidr_block = "${var.vpc_public_subnet_2_cidr}"
  availability_zone = "us-east-1b"
  tags {
    Name = "vpc_public_sn_2"
  }
}

# Routing table for public subnet
resource "aws_route_table" "vpc_public_sn_rt_2" {
  vpc_id = "${aws_vpc.vpc_name.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }
  tags {
    Name = "vpc_public_sn_rt_2"
  }
}

# Associate the routing table to public subnet
resource "aws_route_table_association" "vpc_public_sn_rt_assn_2" {
  subnet_id = "${aws_subnet.vpc_public_sn_2.id}"
  route_table_id = "${aws_route_table.vpc_public_sn_rt_2.id}"
}

# ECS Instance Security group
resource "aws_security_group" "vpc_public_sg" {
  name = "pubic_sg"
  description = "public access security group"
  vpc_id = "${aws_vpc.vpc_name.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "${var.vpc_access_from_ip_range}"]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = [
      "${var.vpc_public_subnet_1_cidr}"]
  }

  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  tags {
    Name = "pubic_sg"
  }
}

output "region" {
  value = "${var.region}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc_name.id}"
}

output "vpc_public_sn_1_id" {
  value = "${aws_subnet.vpc_public_sn_1.id}"
}

output "vpc_public_sn_2_id" {
  value = "${aws_subnet.vpc_public_sn_2.id}"
}

output "vpc_public_sg_id" {
  value = "${aws_security_group.vpc_public_sg.id}"
}
