# Deep Learning in Containers 

[![CI to Docker Hub](https://github.com/abhinand5/deeplearning-dev-containers/actions/workflows/buildAndPush.yml/badge.svg?branch=v0.1.1)](https://github.com/abhinand5/deeplearning-dev-containers/actions/workflows/buildAndPush.yml)
[![](https://img.shields.io/docker/pulls/abhinand5/deeplearning-dev.svg)](https://hub.docker.com/r/abhinand5/deeplearning-dev)
[![](https://img.shields.io/docker/image-size/abhinand5/deeplearning-dev)](https://hub.docker.com/r/abhinand5/deeplearning-dev)
[![](https://img.shields.io/docker/v/abhinand5/deeplearning-dev)](https://hub.docker.com/r/abhinand5/deeplearning-dev)

This is a personal container-based Deep Learning setup I use for development.

> If you find this useful feel free to leave a :star:

## Getting started

### Prerequisites

> The docker images build here only work if you have an Nvidia GPU.

You should have the below mentioned tools set up and ready to go. I have linked the official installation instructions.
1. [Docker](https://docs.docker.com/engine/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)
3. [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)

### Getting it up and running
1. Clone the repo
2. navigate into the repo's root directory. 
3. Use Docker Compose to build the images and launch the containers. 

    `$ sudo docker-compose up -d`

You can also pull the prebuilt deep learning image from docker hub using this command

`$ sudo docker pull abhinand5/deeplearning-dev:v0.1.1`

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)