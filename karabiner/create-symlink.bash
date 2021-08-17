#!/bin/bash

path=$(pwd)
file="my-setup.json"
destination=".config/karabiner/assets/complex_modifications"
rm -f $HOME/${destination}/${file}
ln -s ${path}/${file} $HOME/${destination}
