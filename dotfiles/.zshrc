# --- Environment & Path ---
typeset -U path  
if [[ "$OSTYPE" == "darwin"* ]]; then
    [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
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

    # 1. Manual Initialization (Crucial for NixOS stability)
    autoload -Uz compinit && compinit
    setopt prompt_subst
    setopt autocd

    # 2. Completion UI Styles
    zstyle ':completion:*' menu select
    zstyle ':completion:*' format '%F{yellow}-- %d --%f'

    # 3. Load Starship
    command -v starship >/dev/null && eval "$(starship init zsh)"
    command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

    # 4. Load Carapace (Must come BEFORE Autosuggestions)
    command -v carapace >/dev/null && {
        export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
        export CARAPACE_ZSH_HAS_COMPFIX=1
        source <(carapace _carapace)
    }

    # 5. Load NixOS Plugins Manually (Strict Order)
    # Syntax Highlighting first
    if [ -f /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

    # Autosuggestions LAST (This prevents the "echoecho" ghosting)
    if [ -f /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)
        # Force clear the ghost text on tab
        ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete)
    fi

    # 6. Keybindings
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '^[[A' up-line-or-beginning-search
    bindkey '^[[B' down-line-or-beginning-search

    # --- Aliases ---
    alias vi="hx"
    alias grep="rg"
    alias cat="bat"
    alias ls="lsd --icon always"
    command -v podman >/dev/null && alias docker="podman"
fi