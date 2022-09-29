local mgz = {
	-- Colors need to be in '#rrggbb', not '#rgb'
	-- #ff765e is a nice color
	-- TODO: Maybe use mgz0_gui as none, for transparent background

	mgz0_gui = "#000000", -- mgz0 in palette, background
	mgz1_gui = "#111111", -- mgz1 in palette, current line highlight, scrollbar, lualine middle
	mgz2_gui = "#1b1b1b", -- mgz2 in palette, lualine inner and selection (visual mode) background
	mgz3_gui = "#333333", -- mgz3 in palette, vertical lines on tabs
	mgz3_gui_bright = "#658595", -- out of palette, comments, line numbers
	mgz4_gui = "#1babff", -- mgz4 in palette, console in console.log(), lualine outer (insert mode), commands, text in middle of lualine, WHOLE BUNCHA SHIT
	mgz5_gui = "#ffffff", -- mgz5 in palette, lualine file type, toggleterm block cursor
	mgz6_gui = "#ffffff", -- mgz6 in palette, ???
	mgz7_gui = "#ff6176", -- mgz7 in palette, methods of objects, lualine outer (visual mode)
	mgz8_gui = "#ffffff", -- mgz8 in palette, WHOLE BUNCHA SHIT
	mgz9_gui = "#ffffff", -- mgz9 in palette, ifs, elses, {}=, all the brackets, lualine outer (normal mode), WHOLE BUNCHA SHIT - #658595
	mgz10_gui = "#8edfff", -- mgz10 in palette, object fields
	mgz11_gui = "#ff3333", -- mgz11 in palette, lsp errors - #ff3854
	mgz12_gui = "#00ff00", -- mgz12 in palette, ??? very rarely used
	mgz13_gui = "#f07292", -- mgz13 in palette, !DOCTYPE html, TODO color
	mgz14_gui = "#58F5AB", -- mgz14 in palette, string
	mgz15_gui = "#58F5AB", -- mgz15 in palette, numbers
	none = "NONE",
}

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.mgz_contrast then
	mgz.sidebar = mgz.mgz1_gui
	mgz.float = mgz.mgz1_gui
else
	mgz.sidebar = mgz.mgz0_gui
	mgz.float = mgz.mgz0_gui
end

if vim.g.mgz_cursorline_transparent then
	mgz.cursorlinefg = mgz.mgz0_gui
else
	mgz.cursorlinefg = mgz.mgz1_gui
end

return mgz