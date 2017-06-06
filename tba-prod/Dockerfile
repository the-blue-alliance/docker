FROM ubuntu:14.04
MAINTAINER The Blue Alliance

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Get apt dependencies
RUN apt-get update && apt-get install -y \
  git \
  wget \
  unzip \
  python2.7 \
  python2.7-dev \
  python-pip \
  build-essential \
  checkinstall \
  libssl-dev

# Get appengine environment
RUN wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.40.zip -nv
RUN unzip -q google_appengine_1.9.40.zip
ENV PYTHONPATH="${PYTHONPATH}:/google_appengine"

# Set up nvm and nodejs
ENV NVM_DIR $HOME/.nvm
ENV NODE_VERSION 8.0.0
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm node installation
RUN node -v
RUN npm -v

# Global node packages
RUN npm install uglify-js@2.7.0 -g
RUN npm rm --global gulp
RUN npm install --global gulp-cli
RUN npm install -g less
RUN npm install -g uglifycss
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN git clone https://github.com/the-blue-alliance/the-blue-alliance.git
WORKDIR /the-blue-alliance

# Get TBA dependencies
RUN pip install -r requirements.txt
RUN pip install -r travis_requirements.txt
RUN paver install_libs
RUN npm install
