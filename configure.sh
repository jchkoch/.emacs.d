#!/bin/bash

# Configure Emacs for Linux Users

# make .emacs.d directory in user's home directory
cd ~
mkdir $1

# clone git repository into ~/.emacs.d
git clone https://github.com/jchkoch/.emacs.d.git $1
