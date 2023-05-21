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

	-- Supported by bufdelete
	-- vim.cmd([[cnoreabbrev q Bdelete]])

	-- Supported by bufferline
	map("n", keys.pick_tab, ":BufferLinePick<CR>", option)

	-- Supported by nvim-tree
	map("n", keys.file_explorer, ":Neotree position=left source=filesystem action=show toggle=true<CR>", option)
	map("n", keys.git_status, ":Neotree position=float source=git_status action=show toggle=true<CR>", option)

	-- Supported by aerial
	map("n", keys.outline, ":AerialToggle! right<CR>", option)

	-- Supported by diffview
	map("n", keys.diff_open, ":DiffviewOpen<CR>", option)
	map("n", keys.diff_close, ":DiffviewClose<CR>", option)

	-- Supported by floaterm
	map("n", keys.terminal, ":ToggleTerm<CR><C-\\><C-n>a", option)
	map("t", keys.terminal, "<C-\\><C-n>:ToggleTerm<CR>", option)

	-- Supported by nvim-session-manager
	map("n", keys.switch_session, ":SessionManager load_session<CR>", option)
end

-- Set up the save shortcut
local function set_save_shortcut()
	local is_mac = vim.fn.has("mac") == 1
	local is_linux = vim.fn.has("unix") == 1 and not is_mac
	local is_windows = vim.fn.has("win32") == 1

	-- Define key mappings
	local map = function(mode, lhs, rhs)
		vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true })
	end

	if is_mac then
		map("n", "<D-s>", ":w<CR>")
		map("v", "<D-s>", ":w<CR>")
		map("i", "<D-s>", "<Esc>:w<CR>a")
	elseif is_linux then
		map("n", "<C-s>", ":w<CR>")
		map("v", "<C-s>", ":w<CR>")
		map("i", "<C-s>", "<Esc>:w<CR>a")
	elseif is_windows then
		map("n", "<C-s>", ":w<CR>")
		map("v", "<C-s>", ":w<CR>")
		map("i", "<C-s>", "<Esc>:w<CR>a")
	end
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
local function set_autocmd()
	local hardhacker_config_group = vim.api.nvim_create_augroup("HardHackerConfigGroup", {})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "SessionLoadPost",
		group = hardhacker_config_group,
		callback = function()
			vim.api.nvim_command("Neotree position=left source=filesystem action=show toggle=true")
		end,
	})
end

set_keymap()
set_save_shortcut()
set_transparency()
set_autocmd()
