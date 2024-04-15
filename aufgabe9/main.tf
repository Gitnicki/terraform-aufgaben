resource "null_resource" "run_script" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "bash ./script.sh"
    working_dir = path.module
  }
}
