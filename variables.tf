variable "aws_region" {
  description = "region for ec2"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     = "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "my-security-group"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-instance"
}
