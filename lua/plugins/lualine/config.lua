return function()
	local colors = {
		red = "#e965a5",
		green = "#b1f2a7",
		yellow = "#ebde76",
		blue = "#b1baf4",
		purple = "#e192ef",
		cyan = "#b3f4f3",
		white = "#eee9fc",
		black = "#282433",
		selection = "#282433",
		comment = "#938aad",
	}

	local hardhacker_theme = {
		normal = {
			a = { fg = colors.black, bg = colors.purple },
			b = { fg = colors.red, bg = colors.selection },
			c = { fg = colors.comment, bg = colors.selection },
		},

		insert = { a = { fg = colors.black, bg = colors.green } },
		visual = { a = { fg = colors.black, bg = colors.yellow } },
		replace = { a = { fg = colors.black, bg = colors.red } },

		inactive = {
			a = { fg = colors.white, bg = colors.selection },
			b = { fg = colors.white, bg = colors.selection },
			c = { fg = colors.white, bg = colors.selection },
		},
	}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = hardhacker_theme,
			-- component_separators = { left = "░", right = "░" },
			component_separators = {},
			section_separators = {},
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ "branch" },
				{ "diff" },
			},
			lualine_c = {
				{
					"filename",
					file_status = true, -- Displays file status (readonly status, modified status)
					newfile_status = false, -- Display new file status (new file means no write after created)
					path = 3, -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory

					shorting_target = 40, -- Shortens path to leave 40 spaces in the window
					-- for other components. (terrible name, any suggestions?)
					symbols = {
						modified = "[+]", -- Text to show when the file is modified.
						readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
						unnamed = "[No Name]", -- Text to show for unnamed buffers.
						newfile = "[New]", -- Text to show for newly created file before first write
					},
				},
			},
			lualine_x = { "encoding", "fileformat", "filetype", "filesize" },
			lualine_y = {
				"progress",
				{
					"diagnostics",

					-- Table of diagnostic sources, available sources are:
					--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
					-- or a function that returns a table as such:
					--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
					sources = { "nvim_lsp", "nvim_diagnostic" },

					-- Displays diagnostics for the defined severity types
					sections = { "error", "warn", "info", "hint" },

					diagnostics_color = {
						-- Same values as the general color option can be used here.
						error = "DiagnosticError", -- Changes diagnostics' error color.
						warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
						info = "DiagnosticInfo", -- Changes diagnostics' info color.
						hint = "DiagnosticHint", -- Changes diagnostics' hint color.
					},
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
					colored = true, -- Displays diagnostics status in color if set to true.
					update_in_insert = false, -- Update diagnostics in insert mode.
					always_visible = false, -- Show diagnostics even if there are none.
				},
			},
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end
