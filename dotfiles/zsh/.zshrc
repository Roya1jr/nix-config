# Created by newuser for 5.9
autoload -Uz compinit
compinit

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

#####ENV##########
export PATH="$PATH:/lib"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export EDITOR="hx"
##################


#Zoxide
eval "$(zoxide init zsh)"

#Starship
eval "$(starship init zsh)"

#Aliases
alias docker='podman'
alias grep='rg'
alias cat='bat'
alias ls='lsd --icon always'
alias top='htop'
alias vi='hx'
alias git-local-clean='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'

#Nu Shell
if [ -z "$NU_VERSION" ] && command -v nu >/dev/null 2>&1; then
    exec nu
fi
