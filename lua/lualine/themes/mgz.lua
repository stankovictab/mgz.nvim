-- Special file for Lualine plugin
-- The plugin somehow just reads this file in this filepath, I don't know how, and I don't care
-- It needs to be named mgz.lua in order for Lualine to recognize it via the 'auto' setting

local colors = {
	-- Colors need to be in '#rrggbb', not '#rgb'
	-- #ff765e is a nice color

	col_black = "#000000", -- background
	col_darkgray = "#1b1b1b", -- lualine inner and selection (visual mode) background
	col_bluishgray = "#658595", -- comments, line numbers
	col_blue = "#1babff", -- console in console.log(), lualine outer (insert mode), commands, text in middle of lualine, types
	col_darkblue = "#4e79f0", -- storage, keywords (like let, const, interface)
	col_white = "#ffffff", -- lualine file type, toggleterm block cursor
	col_gray = "#bbbbbb",
	col_pink = "#ff6176", -- methods of objects, lualine outer (visual mode)
	col_orange = "#ff8630", -- search
	col_lightblue = "#8edfff", -- object fields
	col_red = "#F44336", -- lsp errors
	col_green = "#8DF94E",
	col_purple = "#a25dfc", -- !DOCTYPE html, import from
	col_teal = "#58F5AB", -- string
	col_yellow = "#f4da58", -- numbers, builtin functions
	col_cyan = "#2adede", -- liminal color - constants, booleans

	col_dimblack = "#141414", -- current line highlight, scrollbar, lualine inbetween
	col_dimred = "#31100D",
	col_dimgreen = "#11230E",
	col_dimyellow = "#1E1200",
	col_dimblue = "#041824",
	col_dimmagenta = "#281641",
	col_dimcyan = "#0A3535",
	col_dimwhite = "#333333", -- vertical lines on tabs

	none = "NONE",
}

local mgz = {}

-- The sections go a,b,c --- x,y,z (from left to right)
-- If x,y,z are not configured, it'll just mirror the config from the other side
-- It's gui = "bold", not style = "bold"
-- Shift + R is replace mode

mgz.normal = {
	a = { fg = colors.col_black, bg = colors.col_teal, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_black },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
	-- x = { fg = colors.col_white, bg = colors.col_dimblack },
	-- y = { fg = colors.col_white, bg = colors.col_black },
	-- z = { fg = colors.col_teal, bg = colors.col_black, gui = "bold" }
}

mgz.insert = {
	a = { fg = colors.col_black, bg = colors.col_purple, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_black },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
}

mgz.visual = {
	a = { fg = colors.col_black, bg = colors.col_pink, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_black },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
}

mgz.replace = {
	a = { fg = colors.col_black, bg = colors.col_orange, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_black },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
}

mgz.command = {
	a = { fg = colors.col_black, bg = colors.col_green, gui = "bold" },
	b = { fg = colors.col_white, bg = colors.col_black },
	c = { fg = colors.col_white, bg = colors.col_dimblack },
}

mgz.inactive = {
	-- Styling of the inactive version, for when you're in the ignored filetype (NvimTree), or when splitting the window, the lualine of the inactive pane
	-- See inactive_sections in lualine config
	a = { fg = colors.col_pink, bg = colors.col_dimgreen },
	b = { fg = colors.col_gray, bg = colors.col_dimblack },
	c = { fg = colors.col_white, bg = colors.col_dimwhite },
}

mgz.terminal = {
	a = { fg = colors.col_orange, bg = colors.col_black, gui = "bold" }
}

return mgz
