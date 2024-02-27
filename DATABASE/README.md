# MYSQL DATABASE CREATION STEPS

## Overview
This guide will help you create new user in mysql and import the database file.

**STEPS TO CREATE NEW USER:**

1. **Login as root:**
   sudo mysql -u root -p -h localhost
   Press enter

2. **Create new user:**
   CREATE USER 'kvm'@'localhost' IDENTIFIED BY 'kvm2023';

3. **Create database:**
   CREATE DATABASE kvm;

4. **Grant privileges to user:**
   GRANT ALL PRIVILEGES ON kvm.* TO 'kvm'@'localhost';

5. **Logout and Login as new user:**
   quit;
   mysql -u kvm -p

**Steps to import database file:**

1. **Import the database file:**
   mysql -u root -p kvm < /path/to/database/file/kvm.sql (use the kvm.sql file provided in the DATABASE folder.)

2. **Login as New user:**
   mysql -u kvm -p 
   enter password: kvm2023

3. **Use the database:**
   USE kvm;

Now you will be able to access the database via terminal.