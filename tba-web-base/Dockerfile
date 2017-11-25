FROM ubuntu:17.10
MAINTAINER The Blue Alliance

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Get apt dependencies
RUN apt-get update 
RUN apt-get install -y \
  apt-transport-https \
  git \
  wget \
  curl \
  unzip \
  sudo \
  python2.7 \
  python2.7-dev \
  python-pip \
  build-essential \
  checkinstall \
  libssl-dev \
  tmux \
  vim

# Get and update google cloud SDK
# See https://cloud.google.com/sdk/docs/#deb
RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk-artful main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# google cloud dependencies
RUN apt-get update
RUN apt-get install -y \
  google-cloud-sdk \
  google-cloud-sdk-datastore-emulator \
  google-cloud-sdk-app-engine-python
ENV PYTHONPATH "$PYTHONPATH:/usr/lib/google-cloud-sdk/platform/google_appengine"

# Set up nvm and nodejs
ENV NVM_DIR /nvm
ENV NODE_VERSION 8.0.0
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION --silent \
    && nvm alias default $NODE_VERSION \
    && nvm use default --silent

