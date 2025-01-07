# VPC
variable "vpc_id" {}

# Subnet

variable "public_subnet_id" {}    # PRIVATE

# INTERNET GATEWAY
variable "ig_id" {}


# DEstination Cidr

variable "public_destination_cider" {}   # Public


# TAG
variable "belongs_to" {
   type = string
   default = "WP-SQL"
  }