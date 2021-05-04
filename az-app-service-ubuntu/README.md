This sample project deploys an Apache server inside a container. The dockerfile is more geared toward being used in Azure App Services. However you can modify the file to your need.

Note: This is WIP document. Feel free to comment or provide feedback. Will continue to update. 

# Build image:

```
cd dockerfile-examples/az-app-service-ubuntu

sudo docker build .
```

After above command, it will build image and produce following msg.

```
Successfully built d13ede14cab9
```

Note: In above msg, d13ede14cab9 is docker image id. You can also find this id by running
`sudo docker images` command.

```
sudo docker images
REPOSITORY                                              TAG             IMAGE ID       CREATED          SIZE
<none>                                                  <none>          d13ede14cab9   6 minutes ago    286MB
```

# Run App

```
sudo docker run -dt -p 80:80 d13ede14cab9

5ed0d8c2d39057f8061041cbcfb694fb2502b8d2e7b5fd9be9e85d35182f8ad8
```

* Here we are exposing port 80 by specifying in command `-p 80:80`

# Test app
`curl -i localhost:80`

# Check running container
```
sudo docker ps

CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS          PORTS                          NAMES
5ed0d8c2d390   d13ede14cab9   "/bin/sh -c ./app_st…"   About a minute ago   Up 59 seconds   0.0.0.0:80->80/tcp, 2222/tcp   nervous_bardeen
```

* Note: Note Container ID. that's what you will use to exec into container.

# Exec to container and check logs
```
sudo docker exec -it 7afc3676c251 /bin/bash
root@7afc3676c251:/tmp#
```

```
root@7afc3676c251:/tmp# tail -n 10 /var/log/myapp/access.log

172.17.0.1 - - [04/May/2021:18:09:44 +0000] "GET / HTTP/1.1" 200 287 "-" "curl/7.58.0"
```
