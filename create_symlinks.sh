#!/bin/sh

# Thanks to SO: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
os=$($wd/get_os.sh)
# @TODO: read '--dry-run' parameter
# cmd="echo "
cmd=""

# The default behavior of ln if the second arg is a directory
# is to place a link to the first arg inside it
$cmd ln -s $wd/.ncftp ~
$cmd ln -s $wd/.vim ~

$cmd ln -s $wd/.ackrc ~/.ackrc
$cmd ln -s $wd/.bash_profile ~/.bash_profile
$cmd ln -s $wd/.bashrc ~/.bashrc
if [ "$os" == "cygwin" ]; then
	$cmd ln -s $wd/.minttyrc ~/.minttyrc
fi
$cmd ln -s $wd/.profile ~/.profile
$cmd ln -s $wd/.tmux.conf ~/.tmux.conf
$cmd ln -s $wd/.vim/.vimrc ~/.vimrc
$cmd ln -s $wd/.zpreztorc ~/.zpreztorc
$cmd ln -s $wd/.zshrc ~/.zshrc
$cmd ln -s $wd/.zshenv ~/.zshenv

mkdir ~/.subversion
rm -rf ~/.subversion/config
$cmd ln -s $wd/svn_config ~/.subversion/config
