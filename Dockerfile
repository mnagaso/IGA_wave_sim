#

FROM continuumio/miniconda3:latest
LABEL maintainer="Masaru Nagaso <mnsaru22@gmail.com>"


# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Update the apt-get and installs curl
RUN apt-get update \
  && apt-get install -y curl \
    gnupg2

# Update node version on apt-get
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

# Installs node.js, python, pip and setup tools
RUN apt-get update && apt-get install -y --fix-missing\
    python3 \
    python3-pip \
    python3-setuptools \
    nodejs \
    build-essential \
    libzmq3-dev \
    build-essential \
    checkinstall \
    vim \
    git \
    zlib1g-dev \
    openmpi-bin \
    openmpi-doc \
    libopenmpi-dev \
    dos2unix \
    subversion \
    wget \
    libglu1 libxcursor-dev libxft-dev libxinerama1

# Setup python language
ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# Upgrade npm
RUN npm install npm@latest -g

#RUN conda install jupyter jupyterlab
#RUN pip instsall jupyter jupyterlab
#RUN conda install -c conda-forge fenics 

RUN conda install \
  scipy \
  pandas \
  matplotlib \
  jupyter jupyterlab \
  cmake \
  imageio \
  lxml \
  tqdm

RUN conda install axl -c agm-distrib

RUN apt-get install -y x11-apps

# install qt5
#RUN wget http://download.qt.io/official_releases/qt/5.11/5.11.2/qt-opensource-linux-x64-5.11.2.run \
COPY qt-opensource-linux-x64-5.11.2.run /
#RUN chmod a+x qt-opensource-linux-x64-5.11.2.run \
#  && ./qt-opensource-linux-x64-5.11.2.run


## vim option
#RUN jupyter labextension install jupyterlab_vim
#RUN pip3 install jupyter_contrib_nbextensions \
#  && jupyter contrib nbextension install --user \
#  && mkdir -p $(jupyter --data-dir)/nbextensions \
#  && cd $(jupyter --data-dir)/nbextensions \
#  && git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding \
#  && jupyter nbextension enable vim_binding/vim_binding 

