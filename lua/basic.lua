HOME = os.getenv("HOME")

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.updatetime = 200

-- Basic settings
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.completeopt = "menuone,noselect"
vim.opt.history = 1000
vim.opt.startofline = true

-- Mapping waiting time
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

-- Display
vim.opt.scrolloff = 3
vim.opt.showmatch = true
vim.opt.synmaxcol = 300
vim.opt.laststatus = 3

-- vim.opt.list = false -- do not display white characters
-- vim.opt.foldenable = false
-- vim.opt.foldlevel = 4 -- limit folding to 4 levels
-- vim.opt.foldmethod = "syntax" -- use language syntax to generate folds
vim.opt.wrap = false --do not wrap lines even if very long
vim.opt.eol = false -- show if there's no eol char
vim.opt.showbreak = "↪" -- character to show when line is broken

-- Sidebar
vim.opt.number = true -- line number on the left
vim.opt.numberwidth = 3 -- always reserve 3 spaces for line number
vim.opt.signcolumn = "yes" -- keep 1 column for coc.vim  check
vim.opt.modelines = 0
vim.opt.showcmd = true -- display command in bottom bar

-- Search
vim.opt.incsearch = true -- starts searching as soon as typing, without enter needed
vim.opt.ignorecase = true -- ignore letter case when searching
vim.opt.smartcase = true -- case insentive unless capitals used in search

vim.opt.matchtime = 2 -- delay before showing matching paren
vim.opt.mps = vim.o.mps .. ",<:>"

-- White characters
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- indentation rule
vim.opt.formatoptions = "qnj1" -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.opt.expandtab = true -- expand tab to spaces

-- Backup files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false -- do not use swap file

-- Commands mode
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildignore =
	"deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

-- Only show cursorline in the current window and in normal mode.
-- vim.cmd([[
--   augroup cline
--       au!
--       au WinLeave * set nocursorline
--       au WinEnter * set cursorline
--       au InsertEnter * set nocursorline
--       au InsertLeave * set cursorline
--   augroup END
-- ]])

vim.cmd([[
    set noeb
    set t_Co=256
    filetype    plugin indent on
    exec        "nohlsearch"
    syntax      enable
    syntax      on
]])

-- modified by myself
-- disable mouse
-- vim.o.mousemodel = extend
vim.o.mouse = ""

-- disbale display buffer
-- vim.cmd('command! HideBuffer hide')

-- fold code
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false -- no fold to be applied when open a file
-- vim.opt.foldlevel = 99 -- if not set this, fold will be everywhere
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = false

vim.cmd([[
augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end
]])
