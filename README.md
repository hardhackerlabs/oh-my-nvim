<p align="center">
  <img width="180" src="https://github.com/hardhackerlabs/themes/raw/master/media/logo/logo.png" alt="HardHacker">
</p>

<h1 align="center">
    oh-my-nvim 
</h1>

**A handy, pretty, modern nvim configuration with integrated cool and useful plugins 💎**

## 📦 Features

* File explorer
* File find and search
* Float terminal
* LSP
* Pretty code highlighting
* Auto completion
* Languages
* Colors highlighting
* Git integration
* Git diff view
* Pretty Tab line & Status line
* Markdown Preview via your browser
* Starting screen
* Quick resize the window
* Convenient customization of frequently used shortcuts
* ...

## 🎆 Preview

![](./docs/images/start-screen.png)
![](./docs/images/autocmp.png)
![](./docs/images/float-term.png)
![](./docs/images/color-highlight.png)


## 📌 Requirements

* Neovim 0.8+
* Not required, but recommended
    * [nerd font](https://www.nerdfonts.com/font-downloads) 
    * [ripgrep](https://github.com/BurntSushi/ripgrep) 

## 🚧 Install

### MacOS/Linux

#### 0️⃣  Backup your current nvim

```
mv ~/.config/nvim       ~/.config/nvim.bak
mv ~/.local/share/nvim  ~/.local/share/nvim.bak
```

#### 1️⃣  Clone oh-my-nvim repo

```
git clone https://github.com/skoowoo/oh-my-nvim.git ~/.config/nvim
```

#### 2️⃣  Start `nvim` in your terminal, then automatically install and setup all plugins

## ⌨️  Shortcut Keys

[View the default shortcut settings](https://github.com/skoowoo/oh-my-nvim/blob/main/lua/custom_keys.lua)

You can edit the default settings of the shortcut keys in this configuration file (`~/.config/nvim/lua/custom_keys.lua`).

## 🧩 Plugins

* [packer](https://github.com/wbthomason/packer.nvim) (Plugin manager)
* [hardhacker-theme](https://github.com/hardhackerlabs/theme-vim)
* [nvim-notify](https://github.com/rcarriga/nvim-notify)
* [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
* [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
* [vim-floaterm](https://github.com/voldikss/vim-floaterm)
* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* [diffview.nvim](https://github.com/sindrets/diffview.nvim)
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
* [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
* [cmp-path](https://github.com/hrsh7th/cmp-path)
* [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
* [lspkind.nvim](https://github.com/onsails/lspkind.nvim)
* [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
* [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
* [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
* [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)
* [rust.vim](https://github.com/rust-lang/rust.vim)
* [vim-go](https://github.com/fatih/vim-go)
