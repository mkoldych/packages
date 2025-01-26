FROM ubuntu
#VOLUME /hostpipe

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Toronto
ENV HOME /home/mkoldych
ENV PATH "$HOME/bin:$PATH"
ENV PATH "$HOME/d/bin:$PATH"

# Install basic stuff
RUN apt-get update && \
  apt-get -qq -y install software-properties-common && \
  add-apt-repository universe && \
  apt-get update && \
  apt-get -qq -y upgrade && \
  apt-get -qq -y install locales make zsh

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install useful packages
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential openssl curl wget
RUN apt-get install -y libtool unzip git python3-pip stow cscope ccls tmux
RUN apt-get update
RUN apt-get install -y libssl-dev
RUN apt-get install -y npm universal-ctags ripgrep pylint flake8
RUN apt-get install -y silversearcher-ag ack fd-find
RUN apt-get install -y vim
RUN apt-get install -y sudo
RUN apt-get install -y xml2rfc
RUN apt-get install -y ruby-kramdown-rfc2629
RUN apt-get install -y cmake
RUN apt-get install -y libjson-c-dev
RUN apt-get install -y libevent-dev
RUN apt-get install -y pkg-config
RUN apt-get install -y libreadline-dev
RUN apt-get install -y python3-venv
RUN apt-get install -y python3-pynvim
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-setuptools
RUN apt-get install -y python3-wheel
RUN apt-get install -y python3-mypy

# Install python modules
#RUN pip3 install -U pynvim
#RUN python3 -m pip install --upgrade pip setuptools wheel
#RUN python3 -m pip install 'python-lsp-server[all]' pylsp-mypy python-lsp-isort python-lsp-black

# repo neovim version is very old, don't use it
#RUN apt-get install -y neovim

# Copy a pre-downloaded neovim latest version into the container
WORKDIR $HOME
RUN wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN tar -zxvf nvim-linux64.tar.gz
ENV PATH "$HOME/nvim-linux64/bin:$PATH"

# install language servers
RUN npm install -g vim-language-server
RUN npm install -g pyright
RUN npm install -g tree-sitter
#RUN npm install -g tree-sitter-cli
RUN npm install -g node

RUN nvim +PlugInstall +qall

#CMD ["/bin/bash"]
