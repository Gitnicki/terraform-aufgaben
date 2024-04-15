variable "create_file" {
  type    = bool
  default = false
}

resource "null_resource" "conditional_file" {
  count = var.create_file ? 1 : 0

  triggers = {
    create_file = var.create_file
  }

  provisioner "local-exec" {
    command = "echo 'This file was created conditionally' > conditional_file.txt"
  }
}
