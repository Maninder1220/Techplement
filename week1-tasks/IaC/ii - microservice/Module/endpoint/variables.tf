variable "vpc_id" {}

variable "private_subnet_id" {}

variable "sg_id" {}

variable "region" {}

# TAG
variable "belongs_to" {
   type = string
   default = "WP-SQL"
  }