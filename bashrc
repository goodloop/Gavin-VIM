
# Check for an interactive session
[ -z "$PS1" ] && return

SYSTEM=`uname`
if [ "$SYSTEM" = "Darwin" ]
then
export CLICOLOR="xterm-color"
else
alias ls='ls --color=auto'
fi
alias ll='ls -la'
alias la="ls -a"
alias tmux="tmux -2"
alias sudo='sudo -E'
export GOPATH=~/go
export PATH=$PATH:~/bin/:/opt/java/bin/:$GOPATH/bin
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=vim
function mkdirandcp()
{
	if [[ -z "$1" || -z "$2" ]]; then
		cp
		return 1;
	fi
	mkdir -p "$2"
	cp -r "$1" "$2"
}
alias cp="mkdirandcp"
#PS1='[\u@\h \W]\$ '
export http_proxy=`scutil --proxy | awk '\
	/HTTPEnable/ { http_enabled = $3; } \
	/HTTPProxy/ { http_server = $3; } \
	/HTTPPort/ { http_port = $3; } \
	/SOCKSEnable/ { socks_enabled = $3; } \
	/SOCKSProxy/ { socks_server = $3; } \
	/SOCKSPort/ { socks_port = $3; } \
	END { if (socks_enabled == "1") { print "socks5://" socks_server ":" socks_port; } \
	     else if(http_enabled == "1") { print "http://" http_server ":" http_port; } }'`
TTY_IP=${SSH_CLIENT%% *}
PS1="\n\[\033[1;36m\][bg jobs:\j\[\033[1;36m\]]\[\033[0;37m\] \t \
	\[\033[1;37m\][\[\033[1;34m\]\u@\H\[\033[1;37m\]:\[\033[0;32m\]${TTY_IP:-local}-${SSH_TTY:-`tty`} \
	\[\033[0;35m\]+${SHLVL}\[\033[1;37m\]] \[\033[1;37m\]\w\[\033[0;37m\] \n\$ "
