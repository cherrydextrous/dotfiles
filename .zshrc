#Dependencies: Starship, Git, ZSH, FZF, BAT, ZOXIDE.

#ZSH Plugin Directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#Package Manager
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

#Shell Integrations
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

#Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

#Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

#History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#Styling
zstyle ':completion:*' matcher-list 'm:{a-z={A-Za-z}}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#Autoloads
autoload -U compinit && compinit
zinit cdreplay -q

#Keybinds
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#Aliases
alias ls='ls --color'
alias grep='grep --color=auto'
alias cd='z'
alias cat='bat'
alias c='clear'
alias nvim='nvim'
alias dysk='sudo dysk'
alias wcam='sudo webcamize'
alias astro='astroterm --color --constellations --speed 10000 --fps 64 --city London'
alias install='sudo pacman -S'
alias uninstall='sudo pacman -Rcns'
alias packages='sudo pacman -Qe'

#Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

#Keybinds
bindsym print exec --no-startup-id slurp | grim -g - $(xdg-user-dir PICTURES)/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')

#Steam
alias celeste='nohup steam steam://rungameid/504230 & exit'
alias balatro='nohup steam steam://rungameid/2379780 & exit'
alias webfishing='nohup steam steam://rungameid/3146520 & exit'
alias ultrakill='nohup steam steam://rungameid/1229490 & exit'
alias rainworld='nohup steam steam://rungameid/312520 & exit'

#Web Browser
alias f='nohup firefox-developer-edition & exit'

#Start
fastfetch

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi
