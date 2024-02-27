#!/bin/bash

# Define the desired IP address
new_ip_address="your_desired_ip_address"

# Replace the IP address in the file
sed -i "s/ws:\/\/127\.0\.0\.1:9999/ws:\/\/$new_ip_address:9999/g" /var/www/html/od/in.html
sed -i "s/ws:\/\/127\.0\.0\.1:9999/ws:\/\/$new_ip_address:9999/g" /var/www/html/od/in_user.html

echo "WebSocket URL updated to ws://$new_ip_address:9999"