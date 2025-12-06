#!/bin/zsh

DOTFILES="$HOME/personal/dotmac/config"

mkdir -p "$HOME/.config"

configs=(nvim lazygit git ghostty borders)

for config in "${configs[@]}"; do
  rm -rf "$HOME/.config/$config"
  if [ "$config" = "lazygit" ]; then
    ln -s ~/Library/Application\ Support/lazygit ~/personal/dotmac/config
    ln -s ~/personal/dotmac/config/lazygit ~/.config
  else
    ln -s "$DOTFILES/$config" "$HOME/.config/$config"
  fi
done

echo "Checking Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi


ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

echo "Checking plugins..."
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

echo "Linking .zshrc..."
rm -rf "$HOME/.zshrc"
ln -s "$DOTFILES/.zshrc" "$HOME/.zshrc"

echo "Done."

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sudo npm i -g pnpm bun
