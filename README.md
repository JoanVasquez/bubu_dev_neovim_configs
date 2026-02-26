# My Environment Configs

This repo contains my terminal/editor setup:

- `~/.zshrc` (Zsh + Oh My Zsh + aliases + fzf/tmux helpers)
- `~/.config/starship.toml` (Starship prompt theme and modules)
- `~/.config/nvim/` (Neovim config with `lazy.nvim`, LSP, formatter, treesitter, telescope)

## 1. Prerequisites (Ubuntu/WSL)

Install base tools:

```bash
sudo apt update
sudo apt install -y \
  zsh git curl wget unzip build-essential make gcc \
  fzf fd-find ripgrep bat eza tmux
```

Install Neovim (if your distro package is old, use a newer official release):

```bash
sudo apt install -y neovim
```

Optional but recommended:

- Nerd Font in terminal (icons used by prompt + Neovim UI)
- Node.js via `nvm` (helps JS/TS ecosystem tooling)

## 2. Install Oh My Zsh + plugins

Install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install plugins used in `.zshrc`:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Set default shell:

```bash
chsh -s "$(which zsh)"
```

## 3. Install Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

## 4. Install NVM (used by `.zshrc`)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.zshrc
nvm install --lts
```

## 5. Place config files

From this repo root:

```bash
cp .zshrc ~/.zshrc
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml
rm -rf ~/.config/nvim
cp -r nvim ~/.config/nvim
```

Then reload:

```bash
source ~/.zshrc
```

## 6. First Neovim run

Open Neovim once:

```bash
nvim
```

On first start it will:

- bootstrap `lazy.nvim`
- install plugins from `nvim/lazy-lock.json`
- install configured LSP/formatter tools through Mason

Inside Neovim, run:

- `:Lazy sync`
- `:Mason`
- `:checkhealth`

## 7. Extra formatter/linter notes

`none-ls` is configured for:

- `prettier`, `eslint_d`, `shfmt`, `terraform_fmt`, `hadolint`, `sqlfluff`
- `ruff` and `ruff_format`

If `ruff` is missing in Mason on your machine, install it manually:

```bash
pipx install ruff
```

## 8. What to verify

- New shell shows Starship prompt (2-line format with git/runtime modules)
- Aliases work (`ll`, `la`, `lt`, `cat`, `tms`, `tmw`, `tmp`)
- Neovim LSP attaches in supported projects (`:LspInfo`)
- Format-on-save works (`BufWritePre` via `none-ls`)

## 9. Neovim shortcuts

Leader key is `Space`.

- `<C-s>`: save file
- `<leader>sn`: save file without auto-format
- `<C-d>` / `<C-u>`: scroll and keep cursor centered
- `n` / `N`: next/prev search result and keep centered
- Arrow keys: resize splits
- `<C-h>` `<C-j>` `<C-k>` `<C-l>`: move across splits
- `<Tab>` / `<S-Tab>`: next/previous buffer
- `<leader>x`: close current buffer
- `<leader>a`: close all buffers
- `<leader>b`: open new empty buffer
- Visual `p`: paste without overwriting unnamed register
- `[d` / `]d`: previous/next diagnostic
- `<leader>d`: open floating diagnostic
- `<leader>q`: diagnostics list
- Visual `J` / `K`: move selected lines down/up

LSP-related shortcuts (active when LSP is attached):

- `grn`: rename symbol
- `gra`: code action
- `grr`: references
- `gri`: implementation
- `grd`: definition
- `grD`: declaration
- `grt`: type definition
- `gO`: document symbols
- `gW`: workspace symbols
- `<leader>th`: toggle inlay hints (if supported)

Telescope shortcuts:

- `<leader>ff`: find files
- `<leader>fb`: list open buffers
- `<leader>fg`: search git files
- `<leader>gc`: search git commits
- `<leader>gb`: list git branches
- `<leader>gs`: list changed files (git status)
- `<leader>fk`: list keymaps
- `<leader>sg`: live grep across files
- `<leader>s/`: live grep only in open files
- `<leader>/`: fuzzy search in current buffer
