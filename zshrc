# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

plugins=(
    git
    autojump
    brew  
    export LANG=en_US.UTF-8
    jsontools 
    kubectl
)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# History configuration
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

######################
# User configuration #
######################
bindkey "\e\[1\;9C" forward-word
bindkey "\e\[1\;9D" backward-word
bindkey "\e\[dw" backward-kill-word

unset M2_HOME
unset M2

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi
export RUBY_HOME=/usr/local/opt/ruby/bi
export GEM_HOME=$HOME/.gem

export GO_HOME=/usr/local/go/bin
export GOPATH=$HOME/go

export PATH=$RUBY_HOME:$GEM_HOME/bin:$PATH:$GO_HOME

alias colima-start="colima start --arch aarch64 --cpu 2 --memory 2 --network-address"
alias colima-stop="colima stop"
######################
