# Devcontainers Configuration

A centralized repository for managing development environments, including dotfiles, VS Code settings, and repository-specific Dev Container configurations.

## 🚀 Quick Start

### 1. Configure VS Code
To apply the shared VS Code settings and keybindings, copy the files from the `vscode/` directory to your local configuration folder:

**macOS:**
```bash
cp vscode/*.json "$HOME/Library/Application Support/Code/User/"
```

**Linux:**
```bash
cp vscode/*.json "$HOME/.config/Code/User/"
```

### 2. Setup a Dev Container
To link a Dev Container configuration to a local repository, run the corresponding `setup.sh` script.

Example for the `mopidy` repository:
```bash
./github.com/bhagenbourger/mopidy/setup.sh /path/to/your/mopidy/repo
```
*Note: This creates a symbolic link for `.devcontainer` and copies necessary configuration files to `.devcontainer_config` within the target repository.*

## 📂 Repository Structure

| Path | Description |
| :--- | :--- |
| `dotfiles/` | Shell configuration (`.zshrc`, `.p10k.zsh`) and global git ignores. |
| `vscode/` | VS Code configuration files, like `settings.json` and `keybindings.json`. |
| `github.com/bhagenbourger/` | Repository-specific Dev Container configurations. |
| `install.sh` | Main entry point for setting up the dev container; used by vscode. |

## 🛠 Features

- **Zsh & Powerlevel10k**: Pre-configured shell for a productive terminal experience.
- **Gemini CLI**: Integrated AI assistance directly in your terminal.
- **Portable Dev Containers**: Centralized management of complex container configurations, kept separate from the source code of individual projects via `.git/info/exclude`.
