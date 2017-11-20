# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster" 
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx svn pip brew brew-cask golang docker vagrant fasd pod repo sbt supervisor tmux zsh-completions)


# User configuration

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Users/gavin/bin:/opt/java/bin:/Users/gavin/go/bin:/Volumes/HD/android/android-sdk-mac_86/platform-tools:/Volumes/HD/android/android-sdk-mac_86/tools:/Users/gavin/android-ndk:$PATH

source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PS1='%* '$PROMPT
export EDITOR="vim"
alias vi="vim"
export ANDROID_HOME=/Volumes/HD/android/android-sdk-mac_86
export ANDROID_NDK_HOME=~/android-ndk
export CLICOLOR=1
function mkdirandcp()
{
	if [[ -z "$1" || -z "$2" ]]; then
		cp
		return 1;
	fi
	mkdir -p "$2"
	cp -r "$1" "$2"
}
export PATH=$PATH:/usr/texbin
setopt hist_ignore_space
alias yoink='open -a Yoink'
alias cd=" cd"
alias ls=" ls"
compdef _file yoink
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:/Volumes/Code/code/chromium/depot_tools"

#for vlc build
export ANDROID_SDK=$ANDROID_HOME
export ANDROID_NDK=$ANDROID_NDK_HOME

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/usr/texbin/
export NVM_DIR="/Users/gavin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

##for cuda
#export CUDA_HOME=/Developer/NVIDIA/CUDA-8.0
#export PATH=/Developer/NVIDIA/CUDA-8.0/bin:$PATH
#export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib:$DYLD_LIBRARY_PATH

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Python virtualenvs
export WORKON_HOME=$HOME/.virtualenvs  #虚拟环境安装的目录
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
	source /usr/local/bin/virtualenvwrapper.sh
else
	echo "WARNING: Can't find virtualenvwrapper.sh"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export http_proxy=`scutil --proxy | awk '\
	/HTTPEnable/ { http_enabled = $3; } \
	/HTTPProxy/ { http_server = $3; } \
	/HTTPPort/ { http_port = $3; } \
	/SOCKSEnable/ { socks_enabled = $3; } \
	/SOCKSProxy/ { socks_server = $3; } \
	/SOCKSPort/ { socks_port = $3; } \
	END { if (socks_enabled == "1") { print "socks5://" socks_server ":" socks_port; } \
	     else if(http_enabled == "1") { print "http://" http_server ":" http_port; } }'`

#zsh autosuggestion
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
export GVM_DIR="/Users/gavin/.gvm"
[[ -s "/Users/gavin/.gvm/bin/gvm-init.sh" ]] && source "/Users/gavin/.gvm/bin/gvm-init.sh"

