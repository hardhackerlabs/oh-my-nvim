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
				-- [[hi TreesitterContextBottom gui=underline guisp=Grey]],
				[[hi! link TreesitterContextBottom HardHackerGreenSelection]],
				[[hi! link TreesitterContext NormalFloat]],
				[[hi! link TreesitterContextLineNumber LineNr]],
				[[hi! link TreesitterContextSeparator FloatBorder]],
				[[hi! link MatchParen HardHackerYellowYellow]],
				[[hi! link MatchParenCur MatchParen]],
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
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
	},
}
