#!/bin/sh
if [ -L ~/.vim ]
then
	echo "remove original symbolic link ~/.vim"
	rm ~/.vim
fi
echo "update .vim directory symbolic link"
curDir=`pwd`
ln -s $curDir/../vimfiles ~/.vim

if [ -L ~/.vimrc]
then
	echo "remove original symbolic link ~/.vimrc"
	rm ~/.vimrc
fi
echo "update .vimrc symbolic link"
curDir=`pwd`
ln -s $curDir/../vimrc ~/.vimrc

#install all bundle in vimrc
echo "Install plugin in Vundle"
vim +BundleInstall +qall!


#do extra things
#1 setup command-t
echo "setup command t"
curDir=`pwd`
cd $curDir/../vimfiles/bundle/command-t/ruby/command-t
ruby extconf.rb
make
cd $curDir
