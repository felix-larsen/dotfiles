#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting dotfiles installation..."

# Check if dotfiles directory exists
if [ ! -d "$HOME/dotfiles" ]; then
    echo "❌ Error: dotfiles directory not found in $HOME"
    exit 1
fi

# Create the folder structure
echo "📁 Creating directory structure..."
mkdir -p ~/.zsh
cd ~/.zsh

# Download the scripts
echo "📥 Downloading git completion scripts..."
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# Create symlinks
echo "🔗 Creating symlinks..."
DOTFILES="$HOME/dotfiles"

# Function to create symlink if it doesn't exist
create_symlink() {
    local source="$1"
    local target="$2"
    if [ -L "$target" ]; then
        echo "⚠️  Symlink already exists: $target"
    elif [ -f "$target" ]; then
        echo "⚠️  File already exists: $target"
        echo "   Backing up to ${target}.backup"
        mv "$target" "${target}.backup"
        ln -s "$source" "$target"
    else
        ln -s "$source" "$target"
    fi
}

create_symlink "$DOTFILES/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES/.gitignore_global" "$HOME/.gitignore_global"
create_symlink "$DOTFILES/.vimrc" "$HOME/.vimrc"

# Install Dracula Terminal theme
echo "🎨 Installing Dracula Terminal theme..."
if [ -f "$DOTFILES/Dracula.terminal" ]; then
    open "$DOTFILES/Dracula.terminal"
    echo "✅ Dracula theme installed. Please set it as your default theme in Terminal preferences."
else
    echo "⚠️  Dracula theme file not found"
fi

echo "✨ Installation complete!"
echo "Please restart your terminal or run 'source ~/.zshrc' to apply changes."
