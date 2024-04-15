provider "http" {}

resource "http_get" "example" {
  url = "https://api.chucknorris.io/jokes/random"
}

resource "local_file" "response_file" {
  filename = "${path.module}/response.json"
  content  = http_get.example.body
}
