# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
}

variable "availability_zone" {
  description = "availability zone, based on region"
  default = {
    us-east-1 = "us-east-1a"
    us-west-1 = "us-west-1a"
  }
}

########################### VPC Config ##################################

variable "vpc_name" {
  description = "VPC"
}

variable "region" {
  description = "AWS region"
}

variable "vpc_cidr_block" {
  description = "Uber IP addressing for Network"
}

variable "vpc_public_subnet_1_cidr" {
  description = "Public 0.0 CIDR for externally accesible subnet"
}

variable "vpc_public_subnet_2_cidr" {
  description = "Public 0.0 CIDR for externally accesible subnet"
}

variable "vpc_access_from_ip_range" {
  description = "Access can be made from the following IPs"
}

########################### ECS Config ##################################

variable "ecs_cluster" {
  description = "ECS cluster name"
}

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
}

variable "ecs_ami_id" {
  description = "Desired number of instances in the cluster"
}

variable "ecs_instance_type" {
  description = "Desired number of instances in the cluster"
}

variable "ecs_key_pair_name" {
  description = "ECS key pair name"
}

########################### RDS Config ##################################

variable "postgres_db_name" {
  description = "Postgres Database Name"
}

variable "postgres_db_username" {
  description = "Postgres Database Username"
}

variable "postgres_db_password" {
  description = "Postgres Database Password"
}
