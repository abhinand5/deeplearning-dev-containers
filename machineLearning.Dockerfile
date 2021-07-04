# Use small image with Python pre-installed.
FROM python:3.8-slim-buster
# Install required ML packages
RUN pip3 install \
    numpy \
    pandas \
    seaborn \
    scikit-learn \
    plotly \
    plotly_express \
    librosa \
    imbalanced-learn \
    scipy \
    hyperopt
    Pillow \
    tqdm \
    jupyter \
    ray \
    xgboost \
    lightgbm \
    keras \