#!/bin/bash

path=$(pwd)
file=".vimrc"
destination=""
rm -f $HOME/${destination}/${file}
ln -s ${path}/${file} $HOME/${destination}
