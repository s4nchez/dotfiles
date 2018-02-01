#!/bin/zsh

autoload -U colors
colors

eval "$(rbenv init -)"
eval "$(nodenv init -)"

export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/sbin

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
antigen theme sorin
antigen apply
