Run brew doctor to make sure don't need to install xcode command line tools.
Install boot2docker:

coyote@LMDV-ELUBI:~$ brew doctor
Your system is ready to brew.
coyote@LMDV-ELUBI:~$ brew install boot2docker

Go to /usr/local/bin and initialize a boot2docker virtual box:
coyote@LMDV-ELUBI:~$ cd /usr/local/bin/
coyote@LMDV-ELUBI:/usr/local/bin$ ./boot2docker init
coyote@LMDV-ELUBI:/usr/local/bin$ ./boot2docker up

Connect the docker client to the Docker daemon:
coyote@LMDV-ELUBI:/usr/local/bin$ export DOCKER_HOST=tcp://localhost:4243

You can check the docker version:
coyote@LMDV-ELUBI:/usr/local/bin$ docker version

Forward the port range that docker uses by default from host to vm to connect with
containers as if they were running locally.
Power the vm off to do this, and then restart it:
coyote@LMDV-ELUBI:/usr/local/bin$ ./boot2docker stop
coyote@LMDV-ELUBI:/usr/local/bin$ for i in {49000..49900}; do VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i"; VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$i,udp,,$i,,$i"; done
coyote@LMDV-ELUBI:/usr/local/bin$ ./boot2docker start

To connect to the VM:
coyote@LMDV-ELUBI:/usr/local/bin$ ./boot2docker ssh
docker@localhost's password: tcuser

To logout:
docker@boot2docker:~$ exit

To download a simple base image:
coyote@LMDV-ELUBI:/usr/local/bin$ docker pull busybox
coyote@LMDV-ELUBI:/usr/local/bin$ docker info

coyote@LMDV-ELUBI:/usr/local/bin$ docker run busybox /bin/echo hello world
hello world

coyote@LMDV-ELUBI:/usr/local/bin$ docker images

To build a dockerfile:
Put dockerfile named Dockerfile at root of git repository.
In /usr/local/bin run:
coyote@LMDV-ELUBI:/usr/local/bin$ docker build -t memcached_new github.com/ealun/test_dockerfile
coyote@LMDV-ELUBI:/usr/local/bin$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
memcached_new       latest              9fbdf3d7c2a2        2 days ago          428.9 MB

Can then run a shell:
coyote@LMDV-ELUBI:/usr/local/bin$ docker run -i -t memcached_new /bin/bash
root@551dc100c693:/# memcached
can't run as root without the -u switch
root@551dc100c693:/# emacs
root@551dc100c693:/# exit
