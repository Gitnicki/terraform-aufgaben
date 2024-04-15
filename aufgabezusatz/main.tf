provider "random" {}

resource "random_string" "red" {
  length  = 2
  special = false
}

resource "random_string" "green" {
  length  = 2
  special = false
}

resource "random_string" "blue" {
  length  = 2
  special = false
}

resource "local_file" "color_scheme" {
  filename = "${path.module}/color_scheme.txt"
  content  = <<-EOT
    RGB Color Scheme:
    - Red:   #${random_string.red.result}
    - Green: #${random_string.green.result}
    - Blue:  #${random_string.blue.result}
  EOT
}
