-- The first file, table of base 16 colors
-- Colors need to be in '#rrggbb', not '#rgb'

local mgz = {
	-- black = "#000000", -- mgz0 in palette
	black = "NONE", -- mgz0 in palette, background
	dark_gray = "#111111", -- mgz1 in palette, current line highlight, scrollbar, lualine middle
	gray = "#1b1b1b", -- mgz2 in palette, lualine inner and selection (visual mode) background
	light_gray = "#0000ff", -- mgz3 in palette, 
	light_gray_bright = "#333333", -- out of palette, line numbers
	darkest_white = "#1babff", -- mgz4 in palette, console in console.log()
	darker_white = "#05f9ff", -- mgz5 in palette
	white = "#ffffff", -- mgz6 in palette
	teal = "#ff6176", -- mgz7 in palette, methods of objects
	off_blue = "#ffffff", -- mgz8 in palette, WHOLE BUNCHA SHIT
	glacier = "#658595", -- mgz9 in palette, comment
	blue = "#ff00ff", -- mgz10 in palette
	red = "#ff3333", -- mgz11 in palette, lsp errors - #ff3854
	orange = "#00ff00", -- mgz12 in palette
	yellow = "#ffff00", -- mgz13 in palette
	green = "#58F5AB", -- mgz14 in palette, string
	purple = "#58F5AB", -- mgz15 in palette, numbers
	none = "NONE",
}
return mgz

-- #ff765e