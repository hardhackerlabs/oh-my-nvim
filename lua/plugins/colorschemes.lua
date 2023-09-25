return {
	{
		"hardhackerlabs/theme-vim",
		name = "hardhacker",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.hardhacker_darker = 0
			vim.g.hardhacker_hide_tilde = 1
			vim.g.hardhacker_keyword_italic = 1
			vim.cmd("colorscheme hardhacker")
			vim.g.hardhacker_custom_highlights = {
				-- [[hi! link TreesitterContextBottom Type]],
				[[hi TreesitterContextBottom gui=underline guisp=Grey]],
				[[hi! link TreesitterContext Type]],
				[[hi! link TreesitterContextLineNumber Type]],
				[[hi! link TreesitterContextSeparator Type]],
			}
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme tokyonight-storm")
		end,
	},
	{
		"mhartington/oceanic-next",
		priority = 1000,
		--	lazy = lvim.colorscheme ~= "OceanicNext",
	},
}
