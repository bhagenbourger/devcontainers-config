#!/bin/bash

##################################################
# Get the directory where this script is located
##################################################
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)/dotfiles"

##################################################
# Install P10k theme if it doesn't exist
##################################################
if [ ! -d "${HOME}/powerlevel10k" ]; then
    current_path=$(pwd)
    cd /tmp
    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd .. && rm -rf fonts
    cd $current_path
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
fi

##################################################
# Copy files to the home directory
##################################################
cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
cp "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
cp "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"

##################################################
# Gemini CLI
##################################################
current_path=$(pwd)
USER_LOCAL="$HOME/.local"
USER_BIN="$USER_LOCAL/node_modules/.bin"
cd "$USER_LOCAL"
npm install @google/gemini-cli
if [ -f ~/.zshrc ] && ! grep -q "$USER_BIN" ~/.zshrc; then
  echo "export PATH=\"\$PATH:$USER_BIN\"" >> ~/.zshrc
fi
cd $current_path

echo "Dotfiles installation complete!"
