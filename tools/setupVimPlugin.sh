#!/bin/sh
#check if .vim has been setup?if not setup it
if [ -d ~/.vim/ ]
then
	#do nothing
	echo ".vim exist"
else
	echo "this user don't have .vim directory, I'll setup one for him"
	curDir=`pwd`
	echo "$curDir"
	`ln -s $curDir/../vimfiles ~/.vim`
fi
if [ -f ~/.vimrc ]
then
	#do nothing
	echo ".vimrc exist!"
else
	echo "this user don't have .vimrc, I'll setup one for him"
	curDir=`pwd`
	echo "$curDir"
	`ln -s $curDir/../vimrc ~/.vimrc`
fi
#install all bundle in vimrc
`vim +BundleInstall +qall!`


#do extra things
#1 setup command-t
echo "setup command t"
curDir=`pwd`
cd $curDir/../vimfiles/bundle/command-t/ruby/command-t
ruby extconf.rb
make
cd $curDir
