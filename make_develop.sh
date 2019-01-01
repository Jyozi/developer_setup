#!/bin/sh -e
#set -e

cp -r nvim ~/.config/nvim
cp -r .bash_profile ~/.bash_profile
cp -r .bashrc ~/.bashrc
source ~/.bash_profile

if [ -z `uname | grep "Drawin"` ]; then
    # For Mac
    brew install neovim pyenv readline xz
    xcode-select --install
    #sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS*.pkg -target /
    pyenv install 3.6.1
    pyenv global 3.6.1
    pip install pipenv neovim isort jedi autopep8
    pip install --upgrade pip
elif [ -z `which yum` ]; then
    # For Fedora CentOS
    yum install -y neovim pyenv
    yum install -y zlib-devel bzip2 bzip2-devel readline-devel sqlite \
                    sqlite-devel openssl-devel xz xz-devel libffi-devel
    pyenv install 3.6.1
    pyenv global 3.6.1
    pip install pipenv neovim isort jedi autopep8
    pip install --upgrade pip
elif [ -z `which apt-get` ];then
    # For Ubuntu
    sudo apt-get install -y neovim pyenv
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
                            libreadline-dev libsqlite3-dev wget curl llvm \
                            libncurses5-dev libncursesw5-dev xz-utils tk-dev \
                            libffi-dev liblzma-dev python-openssl
    pyenv install 3.6.1
    pyenv global 3.6.1
    pip install pipenv neovim isort jedi autopep8
    pip install --upgrade pip
fi

