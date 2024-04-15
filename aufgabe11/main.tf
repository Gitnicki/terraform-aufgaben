provider "random" {}

variable "min_subnets" {
  default = 1
}

variable "max_subnets" {
  default = 5
}

resource "random_integer" "subnet_count" {
  min = var.min_subnets
  max = var.max_subnets
}

resource "random_integer" "subnet_cidr" {
  count = random_integer.subnet_count.result
  min   = 16
  max   = 24
}

resource "local_file" "subnets_file" {
  filename = "${path.module}/subnets.txt"
  content  = join("\n", random_integer.subnet_cidr.*.result)
}
