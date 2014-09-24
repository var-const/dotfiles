#!/bin/bash

# Thanks to SO: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# cmd="echo "
cmd=""

# The default behavior of ln if the second arg is a directory
# is to place a link to the first arg inside it
$cmd ln -s $wd/.ncftp ~
$cmd ln -s $wd/.vim ~
$cmd ln -s $wd/.ackrc ~/.ackrc
$cmd ln -s $wd/.bash_profile ~/.bash_profile
$cmd ln -s $wd/.bashrc ~/.bashrc
$cmd ln -s $wd/.minttyrc ~/.minttyrc
$cmd ln -s $wd/.profile ~/.profile
$cmd ln -s $wd/.tmux.conf ~/.tmux.conf
$cmd ln -s $wd/.zshrc ~/.zshrc
