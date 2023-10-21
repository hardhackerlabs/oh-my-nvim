return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			-- require'telescope'.setup{}
			require("telescope").setup({
				extensions = {
					aerial = {
						-- Display symbols as <root>.<parent>.<symbol>
						show_nesting = {
							["_"] = false, -- This key will be the default
							json = true, -- You can set the option for specific filetypes
							yaml = true,
						},
					},
					-- file_browser = {
					-- 	theme = "ivy",
					-- 	-- disables netrw and use telescope-file-browser in its place
					-- 	hijack_netrw = true,
					-- 	mappings = {
					-- 		["i"] = {
					-- 			-- your custom insert mode mappings
					-- 		},
					-- 		["n"] = {
					-- 			-- your custom normal mode mappings
					-- 		},
					-- 	},
					-- },
				},
			})
			require("telescope").load_extension "file_browser"

			local option = { noremap = true, silent = true }

			local keys = require("custom_keys")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", keys.find_files, builtin.find_files, option)
			vim.keymap.set("n", keys.live_grep, builtin.live_grep, option)
			vim.keymap.set("n", keys.search_cursor, builtin.grep_string, option)
			vim.keymap.set("n", keys.find_buffer, builtin.buffers, option)
			vim.keymap.set("n", "<Leader>aa", require("telescope").extensions.aerial.aerial, option)
			vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", option)
			vim.keymap.set("n", "<leader>gr", ":Telescope lsp_references<CR>", option)
			vim.keymap.set("n", "<leader>gd", ":Telescope lsp_definitions<CR>", option)
			vim.keymap.set("n", "<leader>GG", ":lua require'telescope.builtin'.live_grep{ search_dirs={\"%:p\"} }<CR>", option) 
			vim.keymap.set("n", "<leader>CC", ":lua require'telescope.builtin'.grep_string{ search_dirs={\"%:p\"} }<CR>", option) 
		end,
	},
}
