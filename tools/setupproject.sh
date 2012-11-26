#!/bin/sh
echo "setting ctags...ctags -R --c++-kinds=+p --fields=+iaS --extra=+q"
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
echo "setting cscope...cscope -Rbq"
find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.c++" -o -name "*.m" -o -name "*.mm"> cscope.files
cscope -bq -i cscope.files
