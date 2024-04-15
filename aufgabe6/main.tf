provider "archive" {}

data "archive_file" "example" {
  type        = "zip"
  output_path = "${path.module}/data/archive.zip"
  source_dir  = "${path.module}/data/files"
}
