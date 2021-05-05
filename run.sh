#!/usr/bin/env bash

PYTHONVERSION=$1

# install software
sudo apt update -y
#sudo apt upgrade -y
sudo apt install -y \
	curl \
	fish \
	git \
	htop \
	neovim \
	tmux \
	libbz2-dev \
	libdb-dev \
	libreadline-dev \
	libffi-dev \
	libgdbm-dev \
	liblzma-dev \
	libncursesw5-dev \
	libsqlite3-dev \
	libssl-dev \
	zlib1g-dev \
	uuid-dev \
	tk-dev 
sudo apt autoremove -y
sudo apt clean -y

# install pyenv
curl https://pyenv.run | bash
echo 'export PATH"=${HOME}/.pyenv/bin:${PATH}"' >> ${HOME}/.bashrc
echo 'eval "$(pyenv init -)"' >> ${HOME}/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ${HOME}/.bashrc

export PATH"=${HOME}/.pyenv/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

${HOME}/.pyenv/bin/pyenv install $PYTHONVERSION
${HOME}/.pyenv/bin/pyenv global $PYTHONVERSION

# install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
echo 'export PATH"=${HOME}/.poetry/bin:${PATH}"' >> ${HOME}/.bashrc
export PATH"=${HOME}/.poetry/bin:${PATH}"
poetry config virtualenvs.in-project true

# copy dotfiles
# change default shell to fish
echo 'exec fish' >> ${HOME}/.bashrc
