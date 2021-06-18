#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo ufw app list

sudo apt-get install s3cmd -y
