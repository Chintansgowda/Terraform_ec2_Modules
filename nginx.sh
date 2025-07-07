#!/bin/bash

sudo apt update
sudo apt install -y nginx 
sudo systemctl start nginx
sudo systemctl enable nginx     
sudo systemctl status nginx

echo <h1>Welcome to Nginx Server</h1> >> /var/www/html/index.html