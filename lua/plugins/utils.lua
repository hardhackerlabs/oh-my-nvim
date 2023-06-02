return {
	{ "rcarriga/nvim-notify" },

	-- resize the window
	{
		"mrjones2014/smart-splits.nvim",
		version = "v1.2.2",
		config = function()
			require("plugins/smart-split/config")()
		end,
	},

	-- buffer delete
	{ "famiu/bufdelete.nvim" },

	-- session
	{
		"Shatur/neovim-session-manager",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local Path = require("plenary.path")
			local config = require("session_manager.config")
			require("session_manager").setup({
				sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
				session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
				dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.loop.cwd()` if the passed `dir` is `nil`.
				autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
				autosave_last_session = true, -- Automatically save last session on exit and on session switch.
				autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
				autosave_ignore_dirs = { "/", "~", "/tmp/" }, -- A list of directories where the session will not be autosaved.
				autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
					"gitcommit",
					"gitrebase",
				},
				autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
				autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
				max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
			})

			-- automatic open neotree sidebar when a session opened
			local hardhacker_config_group = vim.api.nvim_create_augroup("HardHackerConfigGroup", {})
			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "SessionLoadPost",
				group = hardhacker_config_group,
				callback = function()
					vim.api.nvim_command("Neotree position=left source=filesystem action=show")
				end,
			})
		end,
	},
	-- zen-mode
	{
		"folke/zen-mode.nvim",
		dependencies = {
			{
				"junegunn/limelight.vim",
				init = function()
					vim.g.limelight_conceal_guifg = "#938AAD"
					vim.g.limelight_paragraph_span = 1
				end,
			},
		},
		opts = {
			window = {
				backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = 80, -- width of the Zen window
				height = 0.8, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					foldcolumn = "0", -- disable fold column
					list = false, -- disable whitespace characters
				},
			},
			-- callback where you can add custom code when the Zen window opens
			on_open = function(win)
				vim.cmd([[
				Limelight
				]])
			end,
			-- callback where you can add custom code when the Zen window closes
			on_close = function() 
				vim.cmd([[
				Limelight!
				]])
			end,
		},
	},
}
