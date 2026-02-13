FROM ubuntu
#VOLUME /hostpipe

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Toronto
ARG GH_TOKEN
ENV HOME=/home/mkoldych
ENV GH_TOKEN=${GH_TOKEN}
ENV PATH="$HOME/bin:$PATH"
ENV PATH="$HOME/d/bin:$PATH"
COPY certs/ /usr/local/share/ca-certificates/

# Install basic stuff
RUN apt-get update && \
  apt-get -qq -y install software-properties-common && \
  add-apt-repository universe && \
  apt-get update && \
  apt-get -qq -y upgrade && \
  apt-get -qq -y install locales make zsh ca-certificates && \
  update-ca-certificates

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install useful packages
RUN apt-get update && apt-get install -y \
    apt-utils \
    build-essential openssl curl wget \
    cmake \
    docker.io \
    jq \
    libevent-dev \
    libjson-c-dev \
    libreadline-dev \
    libssl-dev \
    libtool unzip git python3-pip stow cscope ccls tmux \
    libtree-sitter-dev \
    npm universal-ctags ripgrep pylint flake8 \
    pkg-config \
    python3-flake8-black \
    python3-mypy \
    python3-pip \
    python3-pynvim \
    python3-setuptools \
    python3-venv \
    python3-wheel \
    ruby-kramdown-rfc2629 \
    silversearcher-ag ack fd-find \
    sudo \
    vim \
    xml2rfc

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
RUN npm install -g @github/copilot

RUN nvim +PlugInstall +qall

#RUN wget -qO- https://www.mongodb.org/static/pgp/server-8.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-8.0.asc
#RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
#RUN echo 'Acquire { https::Verify-Peer false }' | sudo tee -a /etc/apt/apt.conf.d/99verify-peer.conf
#RUN apt-get update && \
#    apt-get install -y mongodb-mongosh


#CMD ["/bin/bash"]
