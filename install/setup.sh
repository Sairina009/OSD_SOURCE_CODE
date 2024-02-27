#!/bin/bash

# Function to install Nginx server
install_nginx() {

    ./nginx_setup.sh
}

# Function to configure Nginx
configure_nginx() {
    ./update_nginx_config.sh
}
# Function to install MySQL server
install_mysql() {
    ./mysql_setup.sh
}

# Function to install PHP
install_php() {
    ./php_setup.sh
}

# Main function to execute all steps
main() {
    install_nginx
    configure_nginx
    install_mysql
    install_php
}

# Execute the main function
main
