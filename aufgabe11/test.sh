#!/bin/bash
# Anzahl der Subnetze generieren
terraform apply -target=random_integer.subnet_count
# Subnetze applyen
terraform apply