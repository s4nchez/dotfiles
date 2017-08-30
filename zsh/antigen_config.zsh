#!/bin/zsh

#source ~/.antigen.git/antigen.zsh
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle history
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv

antigen theme sorin

