# 1. PATH TO OH-MY-ZSH (Crucial: This was missing!)
export ZSH="$HOME/.oh-my-zsh"

# 2. THEME CONFIGURATION
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

# 3. ZSH SETTINGS
# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"
# Update reminder mode
zstyle ':omz:update' mode reminder

# 4. PLUGINS
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# 5. LOAD OH-MY-ZSH
source $ZSH/oh-my-zsh.sh

# 6. USER CONFIGURATION & ALIASES
alias zshconf="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias ghconf="nvim ~/.config/ghostty/config"
alias lg='lazygit'
alias gor="go run ."
alias shadcn="pnpm dlx shadcn@latest"
alias v="nvim"
alias cd="z"
alias tmuxa="tmux attach-session -t"


# Fixed path handling for Google Drive (Using quotes is safer than escaping spaces)
alias cdgd="cd '/Users/rudra/Library/CloudStorage/GoogleDrive-rudranpatel0980@gmail.com/My Drive'"

# 7. POWERLEVEL10K CONFIG
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 8. FZF INTEGRATION
# Only source if fzf is actually installed to prevent errors
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# 9. RUNTIMES (BUN & PNPM)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export PNPM_HOME="/Users/rudra/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(zoxide init zsh)"

# Created by `pipx` on 2025-12-19 16:24:18
export PATH="$PATH:/Users/vyeos/.local/bin"
export PATH="$PATH:/Users/vyeos/.cargo/bin"
