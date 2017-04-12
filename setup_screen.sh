#!/bin/sh

## screen setup script

# install screen
sudo yum -y install sreen

# link to ~/.screenrc
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
ln -s $SCRIPT_DIR/.screenrc ~/.screenrc
