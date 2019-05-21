# S3fs Container 

This container can be used with docker or kubernetes sidecar. 

## Build

1. Docker Build

        $ docker build -t s3fs-sidecar .

2. Copy env-example to env 

        $ cp env-example env

3. Set AWS Variables in env file

## Run
  
        $ docker run -d --env-file env --privileged s3fs-sidecar

## Check Data Mount

        $ docker run -d --env-file env --privileged s3fs-sidecar
        a5a941f9e66b069ac72e5100d87fc22f42f8eceaf871ea2030c8761c0b0ee28e
        $ docker ps
        CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
        a5a941f9e66b        s3fs-sidecar        "./automount.sh"    19 seconds ago      Up 18 seconds                           silly_bhabha
        $ docker exec -it silly_bhabha bash
        [root@a5a941f9e66b /]# ls -ltra /data
        total 5
        drwx------ 1 root root    0 Jan  1  1970 .
        drwxr-xr-x 1 root root    0 May 21 19:03 nginx
        drwxr-xr-x 1 root root 4096 May 21 22:30 ..

    In my example only one folder for nginx applications. Mount succesful.

