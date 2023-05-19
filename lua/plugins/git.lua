return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				preview_config = {
					border = "rounded",
				},
			})
		end,
	},

	{ "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}
