provider "local" {}

resource "random_string" "random_filename" {
  length  = 10
  special = false
}

resource "local_file" "random_file" {
  filename = "${path.module}/${random_string.random_filename.result}-file.txt"
  content  = "This is a random file."
}