# NVIDIA CUDA image as a base
# We also mark this image as "deeplearning-base" so we could use it by name
FROM nvidia/cuda:11.2.0-cudnn8-runtime-ubuntu20.04 AS deeplearning-base
WORKDIR /
# Install essential packages
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    software-properties-common \
    curl \
    zip \
    unzip \
    net-tools \
    openssh-client
# Install Python
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.10 \
    python3-setuptools \
    python3-pip
# Make python3 the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1 
# Upgrade pip
RUN pip -q install pip --upgrade
# Install all basic packages
RUN pip install --no-cache-dir \
    # Jupyter itself
    jupyter \
    # Numpy and Pandas are required a-priori
    numpy pandas \
    # PyTorch with CUDA 11.1 support and Torchvision
    torch torchvision \
    # Upgraded version of Tensorboard with more features
    tensorboardX
# Here we use a base image by its name - "deeplearning-base"
# Install additional packages
FROM deeplearning-base AS other-light
RUN pip install --no-cache-dir \
    # Plotting
    matplotlib \
    seaborn \
    plotly \
    plotly_express \
    # Scientific/ML packages
    scipy \
    scikit-learn \
    lightgbm \
    sktime \
    imbalanced-learn \
    # Image data utils
    opencv-python \
    Pillow \
    # NLP
    transformers \ 
    spacy \
    # Hyperparamerter Optimization
    scikit-optimize \
    hyperopt \
    optuna \
    # Utilities
    timm \
    librosa \
    albumentations \
    tqdm
# Install other useful packages (non-light)
FROM other-light AS other-heavy 
RUN pip install --no-cache-dir \
    tensorflow-cpu \
    xgboost \
    catboost