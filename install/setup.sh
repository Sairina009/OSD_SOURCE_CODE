#!/bin/bash

# Function to install Nginx server
install_nginx() {
    chmod +x nginx_setup.sh  # Add executable permission
    ./nginx_setup.sh
}

# Function to configure Nginx
configure_nginx() {
    chmod +x update_nginx_config.sh  # Add executable permission
    ./update_nginx_config.sh
}

# Function to install MySQL server
install_mysql() {
    chmod +x mysql_setup.sh  # Add executable permission
    ./mysql_setup.sh
}

# Function to install PHP
install_php() {
    chmod +x php_setup.sh  # Add executable permission
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
