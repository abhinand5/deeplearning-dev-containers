# NVIDIA CUDA image as a base
# We also mark this image as "deeplearning-base" so we could use it by name
FROM nvidia/cuda:11.2.0-cudnn8-devel-ubuntu20.04 AS deeplearning-base
WORKDIR /
# Install Python and its tools
RUN apt update && apt install -y --no-install-recommends \
    git \
    build-essential \
    python3-dev \
    python3-pip \
    python3-setuptools
RUN pip3 -q install pip --upgrade
# Install all basic packages
RUN pip3 install \
    # Jupyter itself
    jupyter \
    # Numpy and Pandas are required a-priori
    numpy pandas \
    # PyTorch with CUDA 11.1 support and Torchvision
    torch torchvision \
    # Upgraded version of Tensorboard with more features
    tensorboardX
# Here we use a base image by its name - "deeplearning-base"
FROM deeplearning-base
# Install additional packages
RUN pip3 install \
    matplotlib \
    scikit-learn \
    seaborn 
    timm \
    transformers \
    albumentations \
    cv2 \
    Pillow \
    spacy