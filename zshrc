#!/bin/zsh

eval "$(rbenv init -)"

export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/sbin

# other zsh files
for i in ~/dotfiles/zsh/*.zsh ; do
    if [ -r "$i" ]; then
        . $i
    fi
done

# client specific config
for i in ~/.dotfiles-private/*.zsh ; do
    if [ -r "$i" ]; then
        . $i
    fi
done
