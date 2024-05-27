#!/bin/sh

mkdir ${HOME}/.fonts
cd fonts
cp *.ttf -d ${HOME}/.fonts
sudo fc-cache -f -v
