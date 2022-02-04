function pid-for-port(){
	lsof -n -i4TCP:$1 | grep LISTEN
}

export GPG_TTY=$TTY
gpgconf --launch gpg-agent
