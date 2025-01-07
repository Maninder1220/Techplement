variable "public_key" {}
variable "public_subnet_id" {}
variable "private_subnet_id" {}

variable "sg_id" {}



# TAG
variable "belongs_to" {
   type = string
   default = "WP-SQL"
  }

