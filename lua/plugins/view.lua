return {
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("plugins/lualine/config")()
		end,
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins/neo-tree/config")()
		end,
	},

	-- Outline
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				lazy_load = false,
				open_automatic = require("custom_opts").auto_open_outline,
			})
		end,
	},

	-- Tab line
	{
		"akinsho/bufferline.nvim",
		version = "v4.1.0",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins/bufferline/config")()
		end,
	},

	-- cmd line
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("plugins/noice/config")()
		end,
	},

	-- Improve the ui
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
