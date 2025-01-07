# SUBNET
variable "public_subnet" {}

# VPC
variable "vpc_id" {}


# Random AZ
variable "random_az" {}


# TAG
variable "belongs_to" {
   type = string
   default = "WP-SQL"
  }