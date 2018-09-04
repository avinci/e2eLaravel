# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  default = {
    us-east-1 = "us-east-1a"
    us-west-1 = "us-west-1a"
  }
}

########################### VPC Config ##################################

variable "vpc_name" {
  description = "VPC for building demos"
}

variable "region" {
  description = "AWS region"
}

variable "vpc_cidr_block" {
  description = "Uber IP addressing for demo Network"
}

variable "vpc_public_subnet_1_cidr" {
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
