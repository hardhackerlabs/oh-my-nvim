return {
	{
		"hardhackerlabs/theme-vim",
		name = "hardhacker",
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.hardhacker_darker = 0
			vim.g.hardhacker_hide_tilde = 1
			vim.g.hardhacker_keyword_italic = 1
		end,
		config = function()
			vim.cmd("colorscheme hardhacker")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		--config = function()
		--	vim.cmd("colorscheme tokyonight-storm")
		--end,
	},
}
