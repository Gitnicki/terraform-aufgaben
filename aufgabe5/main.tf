variable "user" {
  description = "Username for the configuration"
}

variable "password" {
  description = "Password for the configuration"
}

data "template_file" "config_template" {
  template = <<TEMPLATE
{
  "user": "${var.user}",
  "password": "${var.password}"
}
TEMPLATE

  vars = {
    user     = var.user
    password = var.password
  }
}

resource "local_file" "config_file" {
  filename = "${path.module}/config.json"
  content  = data.template_file.config_template.rendered
}
