#!/bin/sh
OS=`uname -s`
READLINK="readlink"
if [ $OS = "Darwin" ]
then
READLINK="greadlink"
fi

SRC_PATH=.
#check if we have param1 for source directory
if [ x$1 != x ]
then
	if [ -d $1 ]
	then
		SRC_PATH=${1}
	else
		SRC_PATH=dirname "$1"
		if [ -d $SRC_PATH ]
		then
			echo "source path $SRC_PATH at $LINENO"
		fi
	fi
fi
SRC_PATH=`$READLINK -f $SRC_PATH`

echo "setting ctags in $SRC_PATH..."
echo "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q $SRC_PATH"
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q $SRC_PATH
echo "setting cscope in $SRC_PATH..."
echo "find $SRC_PATH -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.c++" -o -name "*.m" -o -name "*.mm"> cscope.files"
find $SRC_PATH -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.c++" -o -name "*.m" -o -name "*.mm"> cscope.files
echo "cscope -bq -i cscope.files"
cscope -bq -i cscope.files
