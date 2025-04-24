FROM ubuntu
#VOLUME /hostpipe

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Toronto
ENV HOME=/home/mkoldych
ENV PATH="$HOME/bin:$PATH"
ENV PATH="$HOME/d/bin:$PATH"

# Install basic stuff
RUN apt-get update && \
  apt-get -qq -y install software-properties-common && \
  add-apt-repository universe && \
  apt-get update && \
  apt-get -qq -y upgrade && \
  apt-get -qq -y install locales make zsh

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install useful packages
RUN apt-get update && apt-get install -y \
    apt-utils \
    build-essential openssl curl wget \
    libtool unzip git python3-pip stow cscope ccls tmux \
    libssl-dev \
    npm universal-ctags ripgrep pylint flake8 \
    silversearcher-ag ack fd-find \
    vim \
    sudo \
    xml2rfc \
    ruby-kramdown-rfc2629 \
    cmake \
    libjson-c-dev \
    libevent-dev \
    pkg-config \
    libreadline-dev \
    python3-venv \
    python3-pynvim \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python3-mypy \
    python3-flake8-black \
    jq \
    docker.io

# Install python modules
#RUN pip3 install -U pynvim
#RUN python3 -m pip install --upgrade pip setuptools wheel
#RUN python3 -m pip install 'python-lsp-server[all]' pylsp-mypy python-lsp-isort python-lsp-black

# repo neovim version is very old, don't use it
#RUN apt-get install -y neovim

# Copy a pre-downloaded neovim latest version into the container
WORKDIR $HOME
RUN wget --no-check-certificate https://github.com/neovim/neovim-releases/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz
RUN tar -zxvf nvim-linux-x86_64.tar.gz
ENV PATH="$HOME/nvim-linux-x86_64/bin:$PATH"

# install language servers
RUN npm install -g vim-language-server
RUN npm install -g pyright
RUN npm install -g tree-sitter
#RUN npm install -g tree-sitter-cli
RUN npm install -g node

RUN nvim +PlugInstall +qall

#CMD ["/bin/bash"]
