#!/bin/sh

mkdir ~/.fonts
cd ./fonts
cp *.ttf -d ~/.fonts
cd ~/.fonts
sudo fc-cache -f -v
