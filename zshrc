#!/bin/zsh

autoload -U colors
colors
export CLICOLOR=1
export TERM=xterm-256color

eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(jenv init -)"
eval "$(pyenv init -)"

export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export GOPATH=$HOME/go

source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh

# client specific config
for i in ~/.dotfiles-private/*.zsh ; do
    if [ -r "$i" ]; then
        source $i
    fi
done

# other zsh files
for i in ~/dotfiles/zsh/*.zsh ; do
    if [ -r "$i" ]; then
        source $i
    fi
done
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply
