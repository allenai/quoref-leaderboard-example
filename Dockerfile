FROM python:3.6.8-jessie

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Install base packages.
RUN apt-get update --fix-missing && apt-get install -y \
    bzip2 \
    ca-certificates \
    curl \
    gcc \
    git \
    libc-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    wget \
    libevent-dev \
    build-essential && \
    rm -rf /var/lib/apt/lists/*
    
WORKDIR /local

# Copy select files needed for installing requirements.
# We only copy what we need here so small changes to the repository does not trigger re-installation of the requirements.
COPY requirements.txt .
COPY install_requirements.sh .
COPY run_squad.py .
COPY utils_squad.py .
COPY utils_squad_evaluate.py .
COPY run_model.sh .
RUN ./install_requirements.sh

# EXPOSE 8000
Cmd ["/bin/bash"]
