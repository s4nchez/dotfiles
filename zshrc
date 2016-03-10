source ~/.antigen.git/antigen.zsh

antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle history
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen bundle git

antigen theme sorin

eval "$(rbenv init -)"

DOCKER_MACHINE="default"

test "$(docker-machine ls | grep $DOCKER_MACHINE | awk '{print $4}')" = "Running" && eval "$(docker-machine env $DOCKER_MACHINE)"

alias prettyjson='python -m json.tool'

export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$PATH:~/bin

# client specific config
for i in ~/dotfiles_clients/*.zsh ; do
    if [ -r "$i" ]; then
        . $i
    fi
done
