-- The first file, table of base 16 colors

local mgz = {
	-- black = "#000", -- mgz0 in palette
	black = "NONE", -- mgz0 in palette, background
	dark_gray = "#111111", -- mgz1 in palette, current line highlight, scrollbar, lualine middle
	gray = "#0a0C5E", -- mgz2 in palette, lualine inner
	light_gray = "#fC56fA", -- mgz3 in palette
	light_gray_bright = "#333", -- out of palette, line numbers
	darkest_white = "#1babff", -- mgz4 in palette, console in console.log()
	darker_white = "#05f9ff", -- mgz5 in palette
	white = "#fff", -- mgz6 in palette
	teal = "#00ff00", -- mgz7 in palette
	off_blue = "#ffff22", -- mgz8 in palette
	glacier = "#658595", -- mgz9 in palette, comment
	blue = "#5E81AC", -- mgz10 in palette
	red = "#BF616A", -- mgz11 in palette
	orange = "#D08770", -- mgz12 in palette
	yellow = "#EBCB8B", -- mgz13 in palette
	green = "#58F5AB", -- mgz14 in palette, string
	purple = "#B48EAD", -- mgz15 in palette
	none = "NONE",
}
return mgz