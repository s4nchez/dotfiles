#!/bin/zsh

eval "$(rbenv init -)"

export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$PATH:~/bin

# other zsh files
for i in ~/dotfiles/zsh/*.zsh ; do
    if [ -r "$i" ]; then
        . $i
    fi
done

# client specific config
for i in ~/dotfiles_clients/*.zsh ; do
    if [ -r "$i" ]; then
        . $i
    fi
done
