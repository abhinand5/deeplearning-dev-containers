# Deep Learning in Containers 

[![CI to Docker Hub](https://github.com/abhinand5/deeplearning-dev-containers/actions/workflows/buildAndPush.yml/badge.svg?branch=v0.1.2)](https://github.com/abhinand5/deeplearning-dev-containers/actions/workflows/buildAndPush.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/abhinand5/deeplearning-dev.svg)](https://hub.docker.com/r/abhinand5/deeplearning-dev)
[![Image Size](https://img.shields.io/docker/image-size/abhinand5/deeplearning-dev/latest)](https://hub.docker.com/r/abhinand5/deeplearning-dev)
[![Latest Version](https://img.shields.io/docker/v/abhinand5/deeplearning-dev)](https://hub.docker.com/r/abhinand5/deeplearning-dev)

This is a personal container-based Deep Learning setup I am using for development.

> If you find this useful feel free to leave a :star:

## References
1. [Deep learning with containers. Part 1 by Alexander Visheratin in TDS](https://towardsdatascience.com/deep-learning-with-containers-part-1-4779877492a1)

## What does it include?
- PyTorch 1.13 (GPU)
- Tensorflow 2.11 (CPU)
- Huggingface Transformers 4.25
- Several other useful ML/DL packages
- Nvidia GPU Driver 525.x.x
- CUDA 11.3.0
- cuDNN 8
- Multi-stage builds to reduce build times after adding new packages. 
- Tensorboard external container for logging
- Separate CPU image

> **Note**: DOES NOT include tensorflow for GPU as of now. 

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

    You can also use `--build` flag to specify you want to build/rebuild the image.

    `$ sudo docker-compose up -d --build`

You can also pull the prebuilt deep learning image from docker hub using this command. The badge at the top of this README.md file shows the latest version. For a specific version, eg: v0.1.3 

`$ sudo docker pull abhinand5/deeplearning-dev:v0.1.3`

If you want to build the cpu image,

`$ sudo docker-compose -f cpu.docker-compose.yaml up -d --build`

To pull a CPU image you can use the tag `abhinand5/deeplearning-dev:${versionName}-cpu`, for example

`$ sudo docker pull abhinand5/deeplearning-dev:latest-cpu`

> **Note**: Image size is bigger than whats shown in DockerHub, ~8GB after building on my machine for GPU and ~4.5GB for CPU-only.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)