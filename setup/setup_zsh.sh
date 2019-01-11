#!/bin/bash

zsh_path="$(which zsh)"

if [ "$(dscl . -read /Users/$(whoami) UserShell)" != "UserShell: $zsh_path" ]; then
	if ! grep -q "$zsh_path" /etc/shells; then
		echo "$zsh_path" | sudo tee -a /etc/shells
	fi

	chsh -s "$zsh_path"
fi
