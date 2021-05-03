# Your base image. 
FROM ubuntu:latest

# Set user to root
USER root

# Set Work/current directory to /tmp.
WORKDIR /tmp

# Update and Install packages. 
RUN apt-get update
# DEBIAN_FRONTEND=noninteractive -> This makes the installing non interactive. -y will access all needed package installation.
# Update package list based on your requirements. However openssh-server and lynx is required. 
# openssh-server is required in order to SSH into app service running in Azure dashboard. 
# Note: RUN is used to install packages or other programs. RUN creates a layer in docker image.
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 openssh-server lynx

# To ssh into App Services, review following link:
# https://docs.microsoft.com/en-us/azure/app-service/tutorial-custom-container?pivots=container-linux
RUN echo "root:Docker!" | chpasswd
COPY sshd_config /etc/ssh/

# COPY Files.
# Copy needed files to needed location using COPY command. 
# COPY index.html . --> This mean to copy index.html to current working directory. We set current work directory to /tmp above.
COPY app-httpd.conf /etc/apache2/sites-enabled/000-default.conf
COPY index.html /var/www/html/

# Run a script that prepares your env. i.e. create directories and files, updating ENV variables etc.
COPY prepare.sh .
RUN chmod +x /tmp/prepare.sh
RUN /tmp/prepare.sh

# Depending type of application, you may have to open one or more ports. 
# Here 2222 is needed for Azure App Service to enable SSH
EXPOSE 80 2222

# If you are just starting one program in container, then you can simply use CMD like following
# CMD /usr/sbin/apache2ctl -D FOREGROUND
# However, in some case, you may have to perform few steps before starting programs such as web server. 
# In this case, create a script and follow these steps.
COPY app_start.sh /tmp/
RUN chmod u+x /tmp/app_start.sh

# When container get created, following command will be executed.
CMD ./app_start.sh
