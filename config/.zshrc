# 1. PATH TO OH-MY-ZSH (Crucial: This was missing!)
export ZSH="$HOME/.oh-my-zsh"

# 2. THEME CONFIGURATION
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell" # set by `omz`

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
alias tsjs="bunx tsc script.ts && node script.js"
alias zshconf="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias ghconf="nvim ~/.config/ghostty/config"
alias lg='lazygit'
alias gor="go run ."
alias nshadcn="npx shadcn@latest"
alias pshadcn="pnpm dlx shadcn@latest"
alias bshadcn="bunx shadcn@latest"
alias v="nvim"
alias tm="tmux"
alias tma="tmux attach-session"
alias tmat="tmux attach-session -t"
alias cdgd="z '/Users/vyeos/Library/CloudStorage/GoogleDrive-rudranpatel0980@gmail.com/My Drive'"
alias oc="opencode"
alias cc="claude"
alias ccu="claude -p '/usage' | head -5 | tail -3"
alias python="python3.11"
alias pip="pip3.11"
alias fb="fabric"
alias rich="cd ~/personal/yt-rich; uv run ytrich"
alias ls="eza -a --oneline --long --color=always --no-user --no-permissions --icons --group-directories-first"
alias tree="eza -a --oneline --long --color=always --no-user --no-permissions --icons --tree --group-directories-first"
alias s="spf"
alias rss="nvim ~/.local/share/superfile/pinned.json"

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

export PNPM_HOME="/Users/vyeos/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(zoxide init zsh)"

export PATH="$PATH:/Users/vyeos/.local/bin"
source "$HOME/.cargo/env"

export PATH="$(go env GOPATH)/bin:$PATH"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/Users/vyeos/.opencode/bin:$PATH
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/vyeos/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
export ANDROID_HOME=$HOME/Library/Android/sdk 
export PATH=$PATH:$ANDROID_HOME/emulator 
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# pnpm
export PNPM_HOME="/Users/vyeos/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# superfile — keep config/data under ~/.config and ~/.local instead of
# macOS's ~/Library/Application Support (spf has no SPF_* vars, only XDG).
# Also implements cd_on_quit: superfile writes the last dir to
# $XDG_STATE_HOME/superfile/lastdir, which we source and remove on exit.
spf() {
  local xdg_config="${XDG_CONFIG_HOME:-$HOME/.config}"
  local xdg_data="${XDG_DATA_HOME:-$HOME/.local/share}"
  local xdg_state="${XDG_STATE_HOME:-$HOME/.local/state}"
  local last_dir="$xdg_state/superfile/lastdir"

  XDG_CONFIG_HOME="$xdg_config" \
  XDG_DATA_HOME="$xdg_data" \
  XDG_STATE_HOME="$xdg_state" \
  command spf "$@"

  [ ! -f "$last_dir" ] || {
    . "$last_dir"
    rm -f -- "$last_dir" >/dev/null
  }
}
