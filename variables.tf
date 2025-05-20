variable "image_id" {
  type        = string
  description = "value of the image id"
  default     = "ami-1234536543"
}

/* variable "bucket_name" {
  description = "value of the bucket name"
  type        = string
} */

variable "vpc_cidr" {
  type        = string
  description = "value of the vpc cidr"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "value of the subnet cidr"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  type        = string
  description = "value of the availability zone"
  default     = "us-east-1a"
}