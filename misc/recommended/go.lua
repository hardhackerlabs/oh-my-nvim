return {
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				run_in_floaterm = true,
				floaterm = {
					posititon = "center", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
					width = 0.45, -- width of float window if not auto
					height = 0.98, -- height of float window if not auto
				},
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
}
