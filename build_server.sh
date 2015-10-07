#! /bin/bash

source './lib/main.sh'

# Prevents Package Configuration requiring input
DEBIAN_FRONTEND=noninteractive

upgrade

install_nginx
install_php
install_php_drivers

configure_php
configure_nginx

echo -e "Your server is set up and running. \n Copy the source code into $HOME/www"
