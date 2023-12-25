return {
	{
		"hardhackerlabs/theme-vim",
		name = "hardhacker",
		lazy = false,
		priority = 1000,
		config = function()
			if not vim.fn.has("win64") then
				vim.g.hardhacker_darker = 0
				-- if tilde==1, not display endofbuffer and nontext(this causes gitsigns.current_line_blame)
				vim.g.hardhacker_hide_tilde = 1
				vim.g.hardhacker_keyword_italic = 0
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
					[[hi NonText guifg=#ABB2BF]],
					-- [[hi EndOfBuffer=guifg=#282a36]]
				}
			end
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		config = function()
			if vim.fn.has("win64") then
				vim.cmd("colorscheme dracula")
			end
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
		"loctvl842/monokai-pro.nvim",
		priority = 1000,
		config = function()
			require("monokai-pro").setup()
		end,
	},
}
