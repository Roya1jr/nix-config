# --- Environment & Path ---
typeset -U path  

# Platform Detection
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ $INTELLIJ_ENVIRONMENT_READER ]]; then
        return
    fi

    [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
    path+=("$HOME/.cache/lm-studio/bin")

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    path+=(
        /lib
    )
fi


path=(
    /etc/profiles/per-user/$USER/bin
    /run/current-system/sw/bin
    $HOME/.kx/bin
    $HOME/go/bin
    $HOME/.cargo/bin
    $path
)
export PATH
export EDITOR="hx"


# --- Interactive Settings ---
if [[ $- == *i* ]]; then
    # Basic Zsh completions
    autoload -Uz compinit && compinit
    
    # External Tool Init (Check if binary exists before eval)
    command -v carapace >/dev/null && {
        export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
        zstyle ':completion:*' format $'\e[2;37m%d\e[m'
        source <(carapace _carapace)
    }
    
    command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
    command -v starship >/dev/null && eval "$(starship init zsh)"

    # --- Aliases ---
    alias q="rlwrap -r q"
    alias vi="hx"
    
    # Linux-leaning aliases (safe for Mac if tools are installed via Brew)
    alias grep="rg"
    alias cat="bat"
    alias ls="lsd --icon always"
    alias top="htop"
    
    # Only alias docker to podman if podman actually exists
    command -v podman >/dev/null && alias docker="podman"
    
    alias git-local-clean='git branch --merged | grep -Ev "(^\*|master|main|dev)" | xargs -r git branch -d'

    # --- UI & Navigation ---
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '^[[A' up-line-or-beginning-search
    bindkey '^[[B' down-line-or-beginning-search
    
    zstyle ':completion:*' menu select
    setopt autocd
fi