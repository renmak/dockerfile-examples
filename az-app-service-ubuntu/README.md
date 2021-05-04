This sample project deploys an Apache server inside a container. The dockerfile is more geared toward being used in Azure App Services. However you can modify the file to your need.

Note: This is WIP document. Feel free to comment or provide feedback. Will continue to update. 

# Local deployment and testing:

`cd dockerfile-examples/az-app-service-ubuntu`

``

# Test app
`curl -i localhost`


# Exec to container and check logs
```
sudo docker exec -it 7afc3676c251 /bin/bash
root@7afc3676c251:/tmp#
```

```
root@7afc3676c251:/tmp# tail -n 10 /var/log/myapp/access.log

172.17.0.1 - - [04/May/2021:18:09:44 +0000] "GET / HTTP/1.1" 200 287 "-" "curl/7.58.0"
```
