#!/bin/bash

set -e

# Start sshd
#service ssh start
#service ssh status

#2 Start Apache Server
#/usr/sbin/apache2ctl -D FOREGROUND
httpd -D FOREGROUND
