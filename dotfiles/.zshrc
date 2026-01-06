typeset -U path
path=(
    $path
    /lib
    $HOME/go/bin
    $HOME/.cargo/bin
    /etc/profiles/per-user/prince/bin
    /run/current-system/sw/bin
    /opt/homebrew/bin
    $HOME/.kx/bin
)
export PATH

export EDITOR="hx"

# --- 2. Interactive Settings ---
if [[ $- == *i* ]]; then
    # Basic Zsh completions (standard)
    autoload -Uz compinit && compinit
    
    # --- External Tool Init ---
    
    # Carapace
    export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
    zstyle ':completion:*' format $'\e[2;37m%d\e[m'
    source <(carapace _carapace)

    # Zoxide
    eval "$(zoxide init zsh)"

    # Starship
    eval "$(starship init zsh)"


    # --- Aliases ---
    alias docker="podman"
    alias grep="rg"
    alias cat="bat"
    alias ls="lsd --icon always"
    alias top="htop"
    alias vi="hx"
    alias q="rlwrap -r q"
    alias git-local-clean='git branch --merged | grep -Ev "(^\*|master|main|dev)" | xargs -r git branch -d'

    # --- Fish-like UI (Native Zsh) ---
    # History search with Up/Down arrows
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '^[[A' up-line-or-beginning-search
    bindkey '^[[B' down-line-or-beginning-search
    
    # Tab completion menu (arrow keys to select)
    zstyle ':completion:*' menu select
    setopt autocd
fi
