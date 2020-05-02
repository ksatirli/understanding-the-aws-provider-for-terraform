# Amazon Linux 2 AMI (HVM), SSD Volume Type
variable "ami_id" {
  type        = string
  description = "AMI ID to use"
  default     = "ami-0470e33cd681b2476"
}

variable "instance_type" {
  type        = string
  description = "Instance type to use"
  default     = "t2.micro"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone to use"
  default     = "ap-south-1a"
}
