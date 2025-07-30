variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-1"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 3
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name_prefix" {
  description = "Prefix for naming EC2 instances"
  type        = string
  default     = "MyEC2Instance"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}