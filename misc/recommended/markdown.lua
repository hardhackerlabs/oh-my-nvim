return {
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"junegunn/goyo.vim",
		dependencies = {
			{
				"junegunn/limelight.vim",
				init = function()
					vim.g.limelight_conceal_guifg = "#938AAD"
				end,
			},
		},
		config = function()
			-- Enter/Leave goyo markdown mode, so hide/unhide the statusline support by lualine
			goyo_enter = function()
				require("lualine").hide()
				require("barbecue.ui").toggle(false)
				vim.cmd([[
				Limelight
				Gitsigns toggle_signs
				hi CursorLine guibg=NONE
				]])
			end
			goyo_leave = function()
				require("lualine").hide({ unhide = true })
				require("barbecue.ui").toggle(true)
				vim.cmd([[
				Limelight!
				Gitsigns toggle_signs
				]])
			end
			vim.cmd([[
            autocmd! User GoyoEnter nested lua goyo_enter()
            autocmd! User GoyoLeave nested lua goyo_leave()
            ]])
		end,
	},
}
