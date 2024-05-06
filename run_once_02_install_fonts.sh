#!/bin/sh

mkdir ${HOME}/.fonts
cd Downloads
cp *.ttf -d ${HOME}/.fonts
sudo fc-cache -f -v
