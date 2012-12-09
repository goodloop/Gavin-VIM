
# Check for an interactive session
[ -z "$PS1" ] && return

SYSTEM=`uname`
if [ "$SYSTEM" = "Darwin" ]
then
export CLICOLOR="xterm-color"
else
alias ls='ls --color=auto'
fi
alias ll='ls -l'
alias la="ls -a"
alias tmux="tmux -2"
alias sudo='sudo -E'
export PATH=$PATH:~/bin/:/opt/java/bin/
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=vim
#PS1='[\u@\h \W]\$ '
TTY_IP=${SSH_CLIENT%% *}
PS1="\n\[\033[1;36m\][bg jobs:\j\[\033[1;36m\]]\[\033[0;37m\] \t \
	\[\033[1;37m\][\[\033[1;34m\]\u@\H\[\033[1;37m\]:\[\033[0;32m\]${TTY_IP:-local}-${SSH_TTY:-`tty`} \
	\[\033[0;35m\]+${SHLVL}\[\033[1;37m\]] \[\033[1;37m\]\w\[\033[0;37m\] \n\$ "
