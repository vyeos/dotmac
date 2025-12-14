/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/vyeos/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/vyeos/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
brew install git gh nvim luarocks lua lazygit go rust ripgrep fzf fastfetch tmux
git config --global user.name "vyeos"
git config --global user.email "rudranpatel0980@gmail.com"
brew install --cask raycast ghostty google-drive alacritty
