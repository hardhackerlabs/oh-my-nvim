return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = "rounded",
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				-- ["rust_analyzer"] = function ()
				--     require("rust-tools").setup {}
				-- end
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/lspconfig/config")()
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				-- formatting on save
				--on_attach = function(client, bufnr)
				--	if client.supports_method("textDocument/formatting") then
				--		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				--		vim.api.nvim_create_autocmd("BufWritePre", {
				--			group = augroup,
				--			buffer = bufnr,
				--			callback = function()
				--				vim.lsp.buf.format({ bufnr = bufnr })
				--			end,
				--		})
				--	end
				--end,
			}) -- end of setup
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_setup = true,
				ensure_installed = { "shfmt", "prettier", "stylua" },
				handlers = {},
			})
		end,
	},
}
