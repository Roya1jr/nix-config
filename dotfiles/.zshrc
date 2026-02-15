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
    path+=(/lib)
fi

path=(
    /run/wrappers/bin
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

    # 1. Setup Zsh Completion System first
    autoload -Uz compinit && compinit
    
    # Enable visual menu and force prompt substitution (critical for ghosting fix)
    zstyle ':completion:*' menu select
    setopt prompt_subst
    setopt autocd

    # 2. Initialize Prompt & Zoxide
    # We do this AFTER compinit so the prompt can correctly anchor to the ZLE
    command -v starship >/dev/null && eval "$(starship init zsh)"
    command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

    # 3. Initialize Carapace 
    command -v carapace >/dev/null && {
        export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
        
        # This flag helps Carapace avoid "double drawing" glitches in some terminals
        export CARAPACE_ZSH_HAS_COMPFIX=1
        
        # A safer, simpler format for descriptions to prevent character-count mismatches
        zstyle ':completion:*' format '%F{yellow}-- %d --%f'
        
        source <(carapace _carapace)
    }

    # 4. History Search (UI & Navigation)
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '^[[A' up-line-or-beginning-search
    bindkey '^[[B' down-line-or-beginning-search

    # 5. Autosuggestions
    # Note: If ghosting persists, comment out the line below to test
    ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)

    # --- Aliases ---
    alias q="rlwrap -r q"
    alias vi="hx"
    alias grep="rg"
    alias cat="bat"
    alias ls="lsd --icon always"
    alias top="htop"
    
    command -v podman >/dev/null && alias docker="podman"
    alias git-local-clean='git branch --merged | grep -Ev "(^\*|master|main|dev)" | xargs -r git branch -d'

fi
