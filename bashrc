
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias sudo='sudo -E'
export PATH=$PATH:~/bin/:/opt/java/bin/
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=vim
#PS1='[\u@\h \W]\$ '
PS1="\n\[\033[1;36m\][$$:$PPID - bg:\j\[\033[1;36m\]]\[\033[0;37m\] \t \
	\[\033[1;37m\][\[\033[1;34m\]\u@\H\[\033[1;37m\]:\[\033[0;32m\]${SSH_TTY:-o} \
	\[\033[0;35m\]+${SHLVL}\[\033[1;37m\]] \[\033[1;37m\]\w\[\033[0;37m\] \n\$ "