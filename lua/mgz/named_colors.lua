-- The first file, table of base 16 colors
-- Colors need to be in '#rrggbb', not '#rgb'

local mgz = {
	-- black = "#000000", -- mgz0 in palette
	black = "NONE", -- mgz0 in palette, background
	dark_gray = "#111111", -- mgz1 in palette, current line highlight, scrollbar, lualine middle
	gray = "#1b1b1b", -- mgz2 in palette, lualine inner and selection (visual mode) background
	light_gray = "#333333", -- mgz3 in palette, vertical lines on tabs
	light_gray_bright = "#658595", -- out of palette, comments, line numbers
	darkest_white = "#1babff", -- mgz4 in palette, console in console.log(), lualine outer (insert mode), commands, text in middle of lualine, WHOLE BUNCHA SHIT
	darker_white = "#ffffff", -- mgz5 in palette, lualine file type, toggleterm block cursor
	white = "#ffffff", -- mgz6 in palette, ???
	teal = "#ff6176", -- mgz7 in palette, methods of objects, lualine outer (visual mode)
	off_blue = "#ffffff", -- mgz8 in palette, WHOLE BUNCHA SHIT
	glacier = "#ffffff", -- mgz9 in palette, ifs, elses, {}=, all the brackets, lualine outer (normal mode), WHOLE BUNCHA SHIT - #658595
	blue = "#8edfff", -- mgz10 in palette, object fields
	red = "#ff3333", -- mgz11 in palette, lsp errors - #ff3854
	orange = "#00ff00", -- mgz12 in palette, ???
	yellow = "#f07292", -- mgz13 in palette, !DOCTYPE html, TODO color
	green = "#58F5AB", -- mgz14 in palette, string
	purple = "#58F5AB", -- mgz15 in palette, numbers
	none = "NONE",
}
return mgz

-- #ff765e