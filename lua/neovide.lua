if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.o.guifont = "VictorMono Nerd Font:h12" -- text below applies for VimScript
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	-- vim.g.neovide_fullscreen = true
	if vim.fn.has("win64") then
		vim.o.mouse = "a"
	end
	vim.g.neovide_theme = "dark"
	-- vim.g.neovide_floating_shadow = true
	-- vim.g.neovide_floating_z_height = 10
	-- vim.g.neovide_light_angle_degrees = 45
	-- vim.g.neovide_light_radius = 5
end
