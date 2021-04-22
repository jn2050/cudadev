# Dokcer image for cuda and machine learning development environment
* Includes CUDA Toolkit, Anaconda, Pythorch, Rapidsai


|Author|João Neto|
|:---:|:---:|

****
### Pre-Requisites 

* Access to cuda1 host: ssh keys setup for each user

### Current versions 

* Cuda Toolkit 11.1 on Ubuntu 20.04
* Anaconda3 2020.07 Linux distro with Python 3.8.5
* Pytorch 1.8.1


****
### Instalation from source

```
git clone https://github.com/jn2050/cudadev.git
cd cudadev
sudo docker build -t cudadev .
```


****
### Download from dockerhub

```
docker login
docker pull digitallogic/private:cudadev
```


****
### Usage 

* Launch bash shell on cudadev image:

```
docker run -it --rm \
    --privileged \
    -v <dev_dir>:/users/mluser/dev \
    -v <data_dir>:/users/mluser/data \
    ml /bin/bash
```

* Launch Jupyer server on cudadev image (survives reboots):

```
docker run -dit \
    --privileged \
    --restart unless-stopped \
    -p 8888:8888 \
    -v <dev_dir>:/users/mluser/dev \
    -v <data_dir>:/users/mluser/data \
    ml jupyter notebook
```


To stop container:

```
docker stop ml
```

To stop and remove image:

```
docker ps
docker rm -f <container_id>
```
