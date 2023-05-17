<p align="center">
  <img width="180" src="https://github.com/hardhackerlabs/themes/raw/master/media/logo/logo.png" alt="HardHacker">
</p>

<h1 align="center">
    oh-my-nvim<br/>
  <a href="https://discord.com/invite/MGmp9QjfkK">
    <img src="https://img.shields.io/discord/1095552215944527962?style=for-the-badge&logo=discord&color=e965a5&logoColor=eee9fc&labelColor=282433"/>
  </a>
</h1>


A **theme-driven**, out-of-the-box modern configuration of neovim 💎

We developed a theme called [HardHacker](https://github.com/hardhackerlabs/themes), which we thought was pretty and eye friendly,
but we found that many neovim plugins have their own color scheme, 
so we made a neovim integration environment that matches the hardhacker theme.

## 📦 Features

* Session load and switch
* File explorer
* File find and search
* Float terminal
* LSP
* Pretty code highlighting, Colors highlighting
* Auto completion
* Languages
* Git integration
* Git diff view
* Pretty Tab line, Status line
* Markdown Preview via your browser
* Starting screen
* Quick resize the window
* Customization of frequently used shortcuts
* ...

## 🎆 Preview

![](./docs/images/start-screen.png)
![](./docs/images/autocmp.png)
![](./docs/images/float-term.png)
![](./docs/images/find.png)
![](./docs/images/color-highlight.png)

## 📸 Load and switch project

The preview shows opening a project and then switching to another project.
Here the project is loaded and switched via nvim's session.
Thus, a project is a session.

![](./docs/images/v.gif)

When nvim is started in a directory, it is created as a session based on that directory, 
so we can always start nvim in the root directory of a project.

We can use the `F6` shortcut (by default) to select and switch a project(session).

## 📌 Requirements

* Neovim 0.8+
* Not required, but recommended
    * [nerd font](https://www.nerdfonts.com/font-downloads) 
        * Victor Mono Nerd Font
        * JetBrainsMono Nerd Font
        * ...
    * [ripgrep](https://github.com/BurntSushi/ripgrep) 
    * [fd](https://github.com/sharkdp/fd)

## 🚧 Install

### MacOS/Linux

#### 0️⃣  Backup your current nvim

```
mv ~/.config/nvim       ~/.config/nvim.bak
mv ~/.local/share/nvim  ~/.local/share/nvim.bak
```

#### 1️⃣  Clone oh-my-nvim repo

```
git clone https://github.com/hardhackerlabs/oh-my-nvim.git ~/.config/nvim
```

#### 2️⃣  Start `nvim` in your terminal, then automatically install and setup all plugins

#### 3️⃣  Restart `nvim` and enjoy it 🍻 

## 🧱 Languages

#### Install LSP Server

Use command `:LspInstall` to download and install a server, e.g. `:LspInstall rust_analyzer`.

#### Install TreeSitter Parser

Use command `:TSInstall` to download and install a parser, e.g. `:TSInstall rust`.

## 🏠 Custom

### Configuration structure

```
~/.config/nvim/ 
├── init.lua
├── lazy-lock.json
└── lua
    ├── basic.lua
    ├── custom.lua
    ├── custom_keys.lua
    ├── custom_opts.lua
    ├── plugins
    │   ├── my_plugins.lua
    │   └── ...
    └── settings.lua
```

* ~/.config/nvim/lua/plugins/**my_plugins.lua**

    This file does not exist by default, you can create this file and configure the plugins you want.

* ~/.config/nvim/lua/**custom.lua**

    This file does not exist by default, you can create this file, then place some custom configuration logic, the custom.lua module will be loaded last.


### Shortcut Keys ⌨️  

[👉 View the default shortcut settings](https://github.com/hardhackerlabs/oh-my-nvim/blob/main/lua/custom_keys.lua)

You can edit the default settings of the shortcut keys in this configuration file (`~/.config/nvim/lua/custom_keys.lua`).

### Add the plugins you want  

If you want to add your own plugins, you can create a `my_plugins.lua` file in the directory `~/.config/nvim/lua/plugins`. Setup the plugins in this file.

The plugin configuration in the `my_plugins.lua` file refers to the following template (lazy.nvim syntax):

```
return {
    -- Your Plugin1
    {
        'hardhacker/plugin1',
        config = function() ... end
    },

    -- Your Plugin2
    {'hardhacker/plugin2'},
}
```

## 🧩 Plugins

* [lazy.nvim](https://github.com/folke/lazy.nvim) (Plugin manager)
* [hardhacker-theme](https://github.com/hardhackerlabs/theme-vim)
* [nvim-notify](https://github.com/rcarriga/nvim-notify)
* [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
* [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
* [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
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
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* [neo-tree.lua](https://github.com/nvim-neo-tree/neo-tree.nvim)
* [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
* [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
* [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)
* [bufdelete](https://github.com/famiu/bufdelete.nvim)
* [aerial](https://github.com/stevearc/aerial.nvim)
* [neovim-session-manager](https://github.com/Shatur/neovim-session-manager)
* [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)

## 💖 Recommendations for Neovim GUI

* [Neovide](https://neovide.dev/) (Developed by rust)


