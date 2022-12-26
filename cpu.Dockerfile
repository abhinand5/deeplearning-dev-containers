# Python buster official image as a base
# We also mark this image as "ml-base" so we could use it by name
FROM python:3.10.9-buster AS ml-base
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
# Upgrade pip
RUN pip -q install pip --upgrade
# Install all basic packages
RUN pip install --no-cache-dir \
    # Jupyter itself
    jupyter \
    # Numpy and Pandas are required a-priori
    numpy pandas matplotlib
# Here we use a base image by its name - "ml-base"
# Install additional packages
FROM ml-base AS dl-base 
RUN pip install --no-cache-dir \
    torch \
    torchvision \
    torchaudio \
    --extra-index-url https://download.pytorch.org/whl/cpu
FROM dl-base AS util-pkgs
RUN pip install --no-cache-dir \
    # Plotting
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
# Install other useful packages
FROM util-pkgs AS optional 
RUN pip install --no-cache-dir \
    tensorflow-cpu \
    xgboost \
    catboost