local colors = require("mgz.colors")

local mgz = {}

mgz.normal = {
	a = { fg = colors.mgz1_gui, bg = colors.mgz9_gui },
	b = { fg = colors.mgz5_gui, bg = colors.mgz2_gui },
	c = { fg = colors.mgz4_gui, bg = colors.mgz1_gui },
}

mgz.insert = {
	a = { fg = colors.mgz1_gui, bg = colors.mgz4_gui },
	b = { fg = colors.mgz6_gui, bg = colors.mgz2_gui },
	y = {  fg = colors.mgz5_gui, bg = colors.mgz2_gui },
}

mgz.visual = {
	a = { fg = colors.mgz0_gui, bg = colors.mgz7_gui },
	b = { fg = colors.mgz4_gui, bg = colors.mgz2_gui },
	y = {  fg = colors.mgz5_gui, bg = colors.mgz2_gui },
}

mgz.replace = {
	a = { fg = colors.mgz0_gui, bg = colors.mgz11_gui },
	b = { fg = colors.mgz4_gui, bg = colors.mgz2_gui },
	y = {  fg = colors.mgz5_gui, bg = colors.mgz2_gui },
}

mgz.command = {
	a = { fg = colors.mgz0_gui, bg = colors.mgz15_gui, gui = "bold" },
	b = { fg = colors.mgz4_gui, bg = colors.mgz2_gui },
	y = {  fg = colors.mgz5_gui, bg = colors.mgz2_gui },
}

mgz.inactive = {
	a = { fg = colors.mgz4_gui, bg = colors.mgz0_gui, gui = "bold" },
	b = { fg = colors.mgz4_gui, bg = colors.mgz0_gui },
	c = { fg = colors.mgz4_gui, bg = colors.mgz1_gui },
}

return mgz
