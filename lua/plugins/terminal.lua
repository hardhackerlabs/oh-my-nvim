return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local copts = require("custom_opts")

			require("toggleterm").setup({
				highlights = {
					Normal = {
						link = "Normal",
					},
					NormalFloat = {
						link = "Normal",
					},
					FloatBorder = {
						link = "Comment",
					},
				},
				direction = copts.terminal_style,
				float_opts = {
					border = "rounded",
					-- winblend = copts.window_transparency,
					width = function(term)
						local columns = vim.api.nvim_get_option("columns")
						local w = math.floor(columns * copts.terminal_size)
						return (w < 20) and 20 or w
					end,
					height = function(term)
						local lines = vim.api.nvim_get_option("lines")
						local h = math.floor(lines * copts.terminal_size)
						return (h < 35) and 35 or h
					end,
				},
			})
		end,
	},
}
