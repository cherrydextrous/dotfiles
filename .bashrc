#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

alias ls='ls --color=auto'
alias fzp='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias grep='grep --color=auto'
alias cat='bat'
alias f='nohup firefox-developer-edition & exit'
alias fetch='fastfetch'
alias w='sudo webcamize'
alias dysk='sudo dysk'
alias i='sudo pacman -S'
alias yay='yay -S'
alias c='clear'
alias astro='astroterm --color --constellations --speed 10000 --fps 64 --city Washington'
alias l='sudo pacman -Qe'
alias u='sudo pacman -Rcns'
alias celeste='nohup steam steam://rungameid/504230 & exit'
alias balatro='nohup steam steam://rungameid/2379780 & exit'
alias webfishing='nohup steam steam://rungameid/3146520 & exit'
alias ultrakill='nohup steam steam://rungameid/1229490 & exit'
alias rainworld='nohup steam steam://rungameid/312520 & exit'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

alias stowignore='echo "%c" >> .stow-local-ignore'

eval "$(zoxide init bash)"
alias cd="z"

eval "$(fzf init bash)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

eval "$(starship init bash)"

c

fastfetch

PS1='[\u@\h \W]\$ '
