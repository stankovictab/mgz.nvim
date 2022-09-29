-- The second file
-- I think it's just to map logical names to weird names

local named_colors = require("mgz.named_colors")

local mgz = {
	mgz0_gui = named_colors.black, -- mgz0 in palette
	mgz1_gui = named_colors.dark_gray, -- mgz1 in palette
	mgz2_gui = named_colors.gray, -- mgz2 in palette
	mgz3_gui = named_colors.light_gray, -- mgz3 in palette
	mgz3_gui_bright = named_colors.light_gray_bright, -- out of palette
	mgz4_gui = named_colors.darkest_white, -- mgz4 in palette
	mgz5_gui = named_colors.darker_white, -- mgz5 in palette
	mgz6_gui = named_colors.white, -- mgz6 in palette
	mgz7_gui = named_colors.teal, -- mgz7 in palette
	mgz8_gui = named_colors.off_blue, -- mgz8 in palette
	mgz9_gui = named_colors.glacier, -- mgz9 in palette
	mgz10_gui = named_colors.blue, -- mgz10 in palette
	mgz11_gui = named_colors.red, -- mgz11 in palette
	mgz12_gui = named_colors.orange, -- mgz12 in palette
	mgz13_gui = named_colors.yellow, -- mgz13 in palette
	mgz14_gui = named_colors.green, -- mgz14 in palette
	mgz15_gui = named_colors.purple, -- mgz15 in palette
	none = "NONE",
}

-- local mgz = dark_colors

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