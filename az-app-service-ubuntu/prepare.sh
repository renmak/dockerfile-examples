#!/bin/bash

# Create Directories, change permissions etc.


chmod -R 777 /var/www/html
mkdir -p /var/log/myapp/ 2>/dev/null
chmod -R 755 /var/log/myapp/

