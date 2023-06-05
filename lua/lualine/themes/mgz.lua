-- Special file for Lualine plugin
-- The plugin somehow just reads this file in this filepath, I don't know how, and I don't care
-- It needs to be named mgz.lua in order for Lualine to recognize it via the 'auto' setting
-- Colors need to be in '#rrggbb', not '#rgb'

local colors = {
	none = "NONE",
	col_black = "#000000",
	col_darkgray = "#1b1b1b",
	col_bluishgray = "#658595",
	col_blue = "#1babff",
	col_darkblue = "#4e79f0",
	col_white = "#ffffff",
	col_gray = "#bbbbbb",
	col_pink = "#ff6176",
	col_orange = "#ff8630",
	col_lightblue = "#8edfff",
	col_red = "#F44336",
	col_green = "#8DF94E",
	col_purple = "#a25dfc",
	col_teal = "#58F5AB",
	col_yellow = "#f4da58",
	col_cyan = "#2adede", -- liminal color

	col_dimblack = "#141414",
	col_dimred = "#31100D",
	col_dimgreen = "#11230E",
	col_dimyellow = "#1E1200",
	col_dimblue = "#041824",
	col_dimmagenta = "#281641",
	col_dimcyan = "#0A3535",
	col_dimwhite = "#333333",

	col_diminbetween = "#262626",
	col_fours = "#444444"
}

local mgz = {}

-- The sections go a,b,c --- x,y,z (from left to right)
-- If x,y,z are not configured, it'll just mirror the config from the other side
-- It's gui = "bold", not style = "bold"
-- Shift + r is replace mode

mgz.normal = {
	a = { fg = colors.col_black, bg = colors.col_teal, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_diminbetween },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
	-- x = { fg = colors.col_white, bg = colors.col_dimblack },
	-- y = { fg = colors.col_white, bg = colors.col_black },
	-- z = { fg = colors.col_teal, bg = colors.col_black, gui = "bold" }
}

mgz.insert = {
	a = { fg = colors.col_black, bg = colors.col_purple, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_diminbetween },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
}

mgz.visual = {
	a = { fg = colors.col_black, bg = colors.col_pink, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_diminbetween },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
}

mgz.replace = {
	a = { fg = colors.col_black, bg = colors.col_orange, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_diminbetween },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
}

mgz.command = {
	a = { fg = colors.col_black, bg = colors.col_green, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_diminbetween },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
}

mgz.inactive = {
	-- Styling of lualine in an inactive window, when splitting the window, for example
	a = { fg = colors.col_gray, bg = colors.col_darkgray },
	b = { fg = colors.col_gray, bg = colors.col_dimblack },
	c = { fg = colors.col_gray, bg = colors.col_darkgray },
}

mgz.terminal = {
	a = { fg = colors.col_orange, bg = colors.col_black, gui = "bold" }
}

return mgz
