#!/bin/bash
## vorher terraform init
terraform apply -var='user=my_user' -var='password=my_password'
