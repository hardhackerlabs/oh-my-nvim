local keys = require("custom_keys")
local opts = require("custom_opts")

-- Setup keymapping
local function set_keymap()
	local map = vim.keymap.set
	local option = { noremap = true, silent = true }

	map("n", keys.jump_left_window, "<C-W>h", option)
	map("n", keys.jump_down_window, "<C-W>j", option)
	map("n", keys.jump_up_window, "<C-W>k", option)
	map("n", keys.jump_right_window, "<C-W>l", option)
	
	-- modified by myself
	-- ----------------------------------------------------------------------
	-- ALT+N 切换 tab
	-- ----------------------------------------------------------------------
	map("n", "<m-1>", ":tabn 1<CR>", option)
	map("i", "<m-1>", "<ESC>:tabn 1<CR>", option)
	map("n", "<m-2>", ":tabn 2<CR>", option)
	map("i", "<m-2>", "<ESC>:tabn 2<CR>", option)
	map("n", "<m-3>", ":tabn 3<CR>", option)
	map("i", "<m-3>", "<ESC>:tabn 3<CR>", option)
	map("n", "<m-4>", ":tabn 4<CR>", option)
	map("i", "<m-4>", "<ESC>:tabn 4<CR>", option)
	map("n", "<m-5>", ":tabn 5<CR>", option)
	map("i", "<m-5>", "<ESC>:tabn 5<CR>", option)
	map("n", "<m-6>", ":tabn 6<CR>", option)
	map("i", "<m-6>", "<ESC>:tabn 6<CR>", option)
	map("n", "<m-7>", ":tabn 7<CR>", option)
	map("i", "<m-7>", "<ESC>:tabn 7<CR>", option)

	-- ----------------------------------------------------------------------
	-- INSERT 模式下使用 EMACS 键位
	-- ----------------------------------------------------------------------
	map("i", "<c-a>", "<home>", option)
	map("i", "<c-e>", "<end>", option)

	-- ----------------------------------------------------------------------
	--  缓存：插件 unimpaired 中定义了 [b, ]b 来切换缓存
	-- ----------------------------------------------------------------------
	map("n", "<leader>bn", ":bn<cr>", option)
	map("n", "<leader>bp", ":bp<cr>", option)
	map("n", "<leader>1", ":bn<cr>", option)
	map("n", "<leader>2", ":bp<cr>", option)

	vim.cmd([[
    " press esc to cancel search highlight
    nnoremap <silent> <Esc> :nohlsearch<CR>:echo<CR>
	]])

	-- for markdown file
	vim.cmd([[
    " optimized up and down move when set wrap for markdown file
    autocmd FileType markdown noremap <buffer> j gj
    autocmd FileType markdown noremap <buffer> k gk
	autocmd FileType markdown setlocal wrap
	]])

	-- Supported by bufdelete
	vim.cmd([[
	cnoreabbrev bdelete Bdelete
	cnoreabbrev bdelete! Bdelete!
	cnoreabbrev bwipeout Bwipeout
	cnoreabbrev bwipeout! Bwipeout!
	]])

	-- Supported by bufferline
	map("n", keys.pick_tab, ":BufferLinePick<CR>", option)

	-- Supported by nvim-tree
	map("n", keys.file_explorer, ":Neotree position=left source=filesystem action=show toggle=true<CR>", option)
	-- modified by myself for nerdtree
	map("n", "<space>nt", ":Neotree position=left source=filesystem action=show toggle=true<CR>", option)
	map("n", keys.git_status, ":Neotree position=float source=git_status action=show toggle=true<CR>", option)

	-- Supported by aerial
	map("n", keys.outline, ":AerialToggle! right<CR>", option)

	-- Supported by diffview
	map("n", keys.diff_open, ":DiffviewOpen<CR>", option)
	map("n", keys.diff_close, ":DiffviewClose<CR>", option)

	-- Supported by toggleterm
	-- float terminal
	local float_terminal_default = require("toggleterm.terminal").Terminal:new({
		direction = "float",
		on_open = function(term)
			-- forced to change the working dir for terminal
			-- This will solve the problem of not updating the directory when switching sessions.
			local cwd = vim.fn.getcwd()
			if cwd ~= term.dir then
				term:change_dir(cwd)
			end
			-- when float term opened, disable bottom terminal
			vim.api.nvim_del_keymap("t", keys.terminal_bottom)
			vim.cmd("startinsert!")
		end,
		on_close = function(t, job, exit_code, name)
			-- when float term closed, enable bottom terminal
			map("t", keys.terminal_bottom, "<C-\\><C-n>:lua _bottom_term_toggle()<CR>", option)
		end,
	})
	function _float_term_toggle()
		float_terminal_default:toggle()
	end

	-- bottom terminal
	local bottom_terminal_default = require("toggleterm.terminal").Terminal:new({
		direction = "horizontal",
		on_open = function(term)
			-- forced to change the working dir for terminal
			-- This will solve the problem of not updating the directory when switching sessions.
			local cwd = vim.fn.getcwd()
			if cwd ~= term.dir then
				term:change_dir(cwd)
			end

			-- set keymapping
			local opts = { buffer = 0 }
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t",
				"<C-h>",
				[[<Cmd>wincmd h<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t",
				"<C-j>",
				[[<Cmd>wincmd j<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t",
				"<C-k>",
				[[<Cmd>wincmd k<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t",
				"<C-l>",
				[[<Cmd>wincmd l<CR>]],
				{ noremap = true, silent = true }
			)
			vim.cmd("startinsert!")
		end,
		on_exit = function(t, job, exit_code, name)
			vim.cmd("quit!")
		end,
	})
	function _bottom_term_toggle()
		bottom_terminal_default:toggle()
	end

	map("n", keys.terminal_float, ":lua _float_term_toggle()<CR>", option)
	map("t", keys.terminal_float, "<C-\\><C-n>:lua _float_term_toggle()<CR>", option)
	-- modified by myself for floaterm
	map("n", "<space><space>", ":lua _float_term_toggle()<CR>", option)
	map("t", "<ESC>", "<C-\\><C-n>:lua _float_term_toggle()<CR>", option)
	map("n", keys.terminal_bottom, ":lua _bottom_term_toggle()<CR>", option)
	map("t", keys.terminal_bottom, "<C-\\><C-n>:lua _bottom_term_toggle()<CR>", option)

	vim.cmd([[
    command! Termfloat :lua _float_term_toggle()
    ]])
	vim.cmd([[cnoreabbrev terminal Termfloat]])

	-- Supported by nvim-session-manager
	map("n", keys.switch_session, ":SessionManager load_session<CR>", option)
end

-- Set up transparency
local function set_transparency()
	local transparency = opts.window_transparency
	-- Setup global transparency for float window.
	vim.api.nvim_command(string.format("autocmd FileType * set winblend=%d", transparency))
	-- Setup global transparency for popup menu.
	vim.o.pumblend = transparency
end

-- Set up auto command
local function set_autocmd() end

set_keymap()
set_transparency()
set_autocmd()
