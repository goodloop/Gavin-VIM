
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
alias ll='ls -la'
alias sudo='sudo -E'
export PATH=$PATH:~/bin/
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=vim
#PS1="\n\[\033[1;30m\][$$:$PPID - \j:\!\[\033[1;30m\]]\[\033[0;36m\] \T \
	#\[\033[1;30m\][\[\033[1;34m\]\u@\H\[\033[1;30m\]:\[\033[0;37m\]${SSH_TTY:-o} \
	#\[\033[0;32m\]+${SHLVL}\[\033[1;30m\]] \[\033[1;37m\]\w\[\033[0;37m\] \n\$ "
PS1="\n\[\033[1;36m\][$$:$PPID - \j:\!\[\033[1;36m\]]\[\033[0;37m\] \t \
	\[\033[1;37m\][\[\033[1;34m\]\u@\H\[\033[1;37m\]:\[\033[0;32m\]${SSH_TTY:-o} \
	\[\033[0;35m\]+${SHLVL}\[\033[1;37m\]] \[\033[1;37m\]\w\[\033[0;37m\] \n\$ "
