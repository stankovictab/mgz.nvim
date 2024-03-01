-- Colors need to be in '#rrggbb', not '#rgb'
-- To see highlight groups that are missing, do :hi and tab over, or do :Telescope highlights

local mgz = {
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
	col_cyan = "#2adede",

	col_dimblack = "#141414",
	col_dimred = "#31100D",
	col_dimgreen = "#11230E",
	col_dimyellow = "#1E1200",
	col_dimblue = "#041824",
	col_dimmagenta = "#281641",
	col_dimcyan = "#0A3535",
	col_dimwhite = "#333333",

	col_diminbetween = "#262626",
	col_fours = "#444444",
	col_fives = "#555555",
	col_sixes = "#666666",
	col_sevens = "#777777",
	col_eights = "#888888",
	col_nines = "#999999",
	col_tens = "#aaaaaa",
	col_elevens = "#bbbbbb",
	col_twelves = "#cccccc",
	col_thirteens = "#dddddd",
	col_fourteens = "#eeeeee",

	col_offblue = "#61b3ff"
}

-- Toggle for transparent cursorline (the background of the line the cursor is on)
if vim.g.mgz_cursorline_transparent then
	mgz.cursorlinefg = mgz.col_black
else
	mgz.cursorlinefg = mgz.col_dimblack
end

local theme = {}

theme.loadSyntax = function()
	-- Syntax highlight groups (without TreeShitter)
	local syntax = {
		-- Special for me
		jsonCommentError = { fg = mgz.col_comment, bg = mgz.none },       -- Am I the only one who doesn't mind comments in JSON?
		jsonNoQuotesError = { fg = mgz.col_comment, bg = mgz.none },      -- Same issue

		Comment = { fg = mgz.col_bluishgray },                            -- normal comments
		Conditional = { fg = mgz.col_purple },                            -- normal if, then, else, endif, switch, etc.
		Function = { fg = mgz.col_pink },                                 -- normal function names
		Identifier = { fg = mgz.col_lightblue },                          -- any variable name
		Keyword = { fg = mgz.col_darkblue },                              -- normal for, do, while, etc.
		Repeat = { fg = mgz.col_purple },                                 -- normal any other keyword
		String = { fg = mgz.col_teal },                                   -- any string
		Type = { fg = mgz.col_blue },                                     -- int, long, char, etc.
		StorageClass = { fg = mgz.col_white },                            -- static, register, volatile, etc.
		Structure = { fg = mgz.col_white },                               -- struct, union, enum, etc.
		Constant = { fg = mgz.col_cyan },                                 -- constants are true and false, for example
		Character = { fg = mgz.col_teal },                                -- any character constant: 'c', '\n'
		Number = { fg = mgz.col_teal },                                   -- a number constant: 5
		Boolean = { fg = mgz.col_cyan },                                  -- a boolean constant: TRUE, false
		Float = { fg = mgz.col_yellow },                                  -- a floating point constant: 2.3e10
		Statement = { fg = mgz.col_darkblue },                            -- like local in lua
		Label = { fg = mgz.col_lightblue },                               -- case, default, etc.
		Operator = { fg = mgz.col_yellow },                               -- sizeof", "+", "*", etc.
		Exception = { fg = mgz.col_yellow },                              -- try, catch, throw
		PreProc = { fg = mgz.col_darkblue },                              -- generic Preprocessor, like the headings in :checkhealth, or ...?
		Include = { fg = mgz.col_purple },                                -- preprocessor #include, also import and from
		Define = { fg = mgz.col_white },                                  -- preprocessor #define
		Macro = { fg = mgz.col_white },                                   -- same as Define
		Typedef = { fg = mgz.col_white },                                 -- A typedef
		PreCondit = { fg = mgz.col_purple },                              -- preprocessor #if, #else, #endif, etc.
		Special = { fg = mgz.col_blue },                                  -- any special symbol
		SpecialChar = { fg = mgz.col_purple },                            -- special character in a constant
		Tag = { fg = mgz.col_blue },                                      -- you can use CTRL-] on this
		Delimiter = { fg = mgz.col_white },                               -- character that needs attention like , or .
		SpecialComment = { fg = mgz.col_orange },                         -- special things inside a comment
		Debug = { fg = mgz.col_red },                                     -- debugging statements
		Underlined = { fg = mgz.col_teal, bg = mgz.none, style = "underline" }, -- text that stands out, HTML links
		Ignore = { fg = mgz.col_dimblack },                               -- left blank, hidden
		Error = { fg = mgz.col_red, bg = mgz.none, style = "bold,underline" }, -- any erroneous construct
		Todo = { fg = mgz.col_black, bg = mgz.col_pink, style = "bold" }, -- anything that needs extra attention - TODO FIXME and XXX

		htmlLink = { fg = mgz.col_teal, style = "underline" },
		htmlH1 = { fg = mgz.col_lightblue, style = "bold" },
		htmlH2 = { fg = mgz.col_lightblue, style = "bold" },
		htmlH3 = { fg = mgz.col_lightblue, style = "bold" },
		htmlH4 = { fg = mgz.col_lightblue, style = "bold" },
		htmlH5 = { fg = mgz.col_lightblue, style = "bold" },
		markdownH1 = { fg = mgz.col_lightblue, style = "bold" },
		markdownH2 = { fg = mgz.col_lightblue, style = "bold" },
		markdownH3 = { fg = mgz.col_lightblue, style = "bold" },
		markdownH4 = { fg = mgz.col_lightblue, style = "bold" },
		markdownH5 = { fg = mgz.col_lightblue, style = "bold" },
		markdownH6 = { fg = mgz.col_lightblue, style = "bold" },
		markdownH1Delimiter = { fg = mgz.col_purple, style = "bold"},
		markdownH2Delimiter = { fg = mgz.col_purple, style = "bold"},
		markdownH3Delimiter = { fg = mgz.col_purple, style = "bold"},
		markdownH4Delimiter = { fg = mgz.col_purple, style = "bold"},
		markdownH5Delimiter = { fg = mgz.col_purple, style = "bold"},
		markdownH6Delimiter = { fg = mgz.col_purple, style = "bold"},
		markdownCodeDelimiter = { fg = mgz.col_blue },
		markdownCode = { fg = mgz.col_darkblue, bg = mgz.col_dimblue },
		markdownUrl = { fg = mgz.col_blue, style = "underline" },
		markdownLinkTextDelimiter = { fg = mgz.col_lightblue },
		markdownLinkDelimiter = { fg = mgz.col_lightblue },
	}

	-- Italic check (without TreeShitter)
	if vim.g.mgz_italic == true then
		syntax.Comment = { fg = mgz.col_bluishgray, bg = mgz.none, style = "italic" } -- Italic comments
	end

	return syntax
end

theme.loadEditor = function()
	-- Editor highlight groups
	-- This is the most important group, literally NeoVim colors

	local editor = {
		-- These are the colors for popup windows like :LspInfo and :Mason
		NormalFloat = { fg = mgz.col_white, bg = mgz.col_dimblack },   -- Text and background of floating popups, for example the popup on LSP hover, or Packer's popup
		FloatBorder = { fg = mgz.col_white, bg = mgz.col_dimblack },   -- The border of the popup, seen on Packer's popup for example, around the border
		ColorColumn = { fg = mgz.none, bg = mgz.col_dimblack },        -- Used for the columns set with 'colorcolumn'
		Conceal = { fg = mgz.col_fours },                              -- placeholder characters substituted for concealed text (see 'conceallevel'), an example is dir, url, branch, etc in Lazy's panel when you expand a plugin
		Cursor = { fg = mgz.col_blue, bg = mgz.none, style = "reverse" }, -- the character under the cursor
		CursorIM = { fg = mgz.col_white, bg = mgz.none, style = "reverse" }, -- like Cursor, but used when in IME mode
		Directory = { fg = mgz.col_pink, bg = mgz.none },              -- directory names (and other special names in listings)
		EndOfBuffer = { fg = mgz.col_dimblack },
		ErrorMsg = { fg = mgz.none },
		VertSplit = { fg = mgz.col_cyan, bg = mgz.none }, -- Color of bar between vertically split panes (like [] | [])
		Folded = { fg = mgz.col_bluishgray, bg = mgz.none, style = "italic" },
		FoldColumn = { fg = mgz.col_pink },
		IncSearch = { fg = mgz.col_black, bg = mgz.col_cyan, style = "bold" }, -- Current search result while typing with /
		CurSearch = { fg = mgz.col_black, bg = mgz.col_cyan, style = "bold" }, -- Current selected search result after / by pressing n or N
		Search = { fg = mgz.col_black, bg = mgz.col_orange, style = "bold" }, -- Search results after /
		LineNr = { fg = mgz.col_dimwhite },                               -- Line numbers
		CursorLineNr = { fg = mgz.col_blue },                             -- Active line number color
		-- MatchParen = { fg = mgz.col_blue, bg = mgz.none, style = "bold,underline" }, -- Matched parenthesis
		MatchParen = { fg = mgz.col_white, bg = mgz.col_blue, style = "bold" }, -- Matched parenthesis
		ModeMsg = { fg = mgz.col_blue },
		MoreMsg = { fg = mgz.col_blue },
		-- The NonText highlight group gets applied to the little @@@ on the bottom right when you're on a line that is wrapping into a new line, indicating that there's more text (see :h hl-NonText)
		NonText = { fg = mgz.col_darkgray, bg = mgz.none },
		-- Pmenu is the popup menu when tabbing in command mode, for example
		Pmenu = { fg = mgz.col_white, bg = mgz.col_dimblack },              -- Normal element
		PmenuSel = { fg = mgz.col_white, bg = mgz.col_dimwhite, style = "bold" }, -- Selected element
		PmenuSbar = { fg = mgz.col_dimblack, bg = mgz.col_dimblack },       -- Background of the scrollbar, only bg is seen
		PmenuThumb = { fg = mgz.col_white, bg = mgz.col_white },            -- "Thumb" (active part) of the scrollbar, only bg is seen
		Question = { fg = mgz.col_teal },
		QuickFixLine = { fg = mgz.col_blue, bg = mgz.none, style = "reverse" },
		qfLineNr = { fg = mgz.col_blue, bg = mgz.none, style = "reverse" },
		SpecialKey = { fg = mgz.col_white },
		SpellBad = { fg = mgz.col_red, bg = mgz.none, style = "italic,undercurl" },
		SpellCap = { fg = mgz.col_pink, bg = mgz.none, style = "italic,undercurl" },
		SpellLocal = { fg = mgz.col_orange, bg = mgz.none, style = "italic,undercurl" },
		SpellRare = { fg = mgz.col_white, bg = mgz.none, style = "italic,undercurl" },
		-- Status line without lualine (open with nvim --noplugin)
		-- But also the "status line" or really horizontal border when executing a command
		StatusLine = { fg = mgz.col_pink, bg = mgz.col_dimblue }, -- The [No Name] line and background
		StatusLineNC = { fg = mgz.col_blue, bg = mgz.col_dimblack },
		StatusLineTerm = { fg = mgz.col_blue, bg = mgz.col_darkgray },
		StatusLineTermNC = { fg = mgz.col_blue, bg = mgz.col_dimblack },
		TabLineFill = { fg = mgz.col_blue, bg = mgz.none },
		TablineSel = { fg = mgz.col_dimblack, bg = mgz.col_white },
		Tabline = { fg = mgz.col_blue, bg = mgz.col_dimblack },
		Title = { fg = mgz.col_teal, bg = mgz.none, style = "bold" },
		Visual = { fg = mgz.white, bg = mgz.col_dimwhite }, -- Color of highlight in Visual Mode
		VisualNOS = { fg = mgz.none, bg = mgz.col_darkgray }, -- This is depricated
		-- This is the message in command bar when something goes wrong in packer for example.
		WarningMsg = { fg = mgz.col_orange },           -- Overrides
		WildMenu = { fg = mgz.col_green, bg = mgz.none, style = "bold" },
		CursorColumn = { fg = mgz.none, bg = mgz.cursorlinefg },
		CursorLine = { fg = mgz.none, bg = mgz.cursorlinefg },
		ToolbarLine = { fg = mgz.col_blue, bg = mgz.col_dimblack },
		ToolbarButton = { fg = mgz.col_blue, bg = mgz.none, style = "bold" },
		NormalMode = { fg = mgz.col_blue, bg = mgz.none, style = "reverse" },
		InsertMode = { fg = mgz.col_teal, bg = mgz.none, style = "reverse" },
		ReplacelMode = { fg = mgz.col_red, bg = mgz.none, style = "reverse" },
		VisualMode = { fg = mgz.col_white, bg = mgz.none, style = "reverse" },
		CommandMode = { fg = mgz.col_blue, bg = mgz.none, style = "reverse" },
		Warnings = { fg = mgz.col_yellow },

		healthError = { fg = mgz.col_red },
		healthSuccess = { fg = mgz.col_teal },
		healthWarning = { fg = mgz.col_yellow },

		-- dashboard
		DashboardShortCut = { fg = mgz.col_pink },
		DashboardHeader = { fg = mgz.col_white },
		DashboardCenter = { fg = mgz.col_orange },
		DashboardFooter = { fg = mgz.col_teal, style = "italic" },

		-- nvim-notify
		NotifyDEBUGBorder = { fg = mgz.col_dimwhite },
		NotifyDEBUGIcon = { fg = mgz.col_dimwhite },
		NotifyDEBUGTitle = { fg = mgz.col_dimwhite },
		NotifyERRORBorder = { fg = mgz.col_red },
		NotifyERRORIcon = { fg = mgz.col_red },
		NotifyERRORTitle = { fg = mgz.col_red },
		NotifyINFOBorder = { fg = mgz.col_teal },
		NotifyINFOIcon = { fg = mgz.col_teal },
		NotifyINFOTitle = { fg = mgz.col_teal },
		NotifyTRACEBorder = { fg = mgz.col_yellow },
		NotifyTRACEIcon = { fg = mgz.col_yellow },
		NotifyTRACETitle = { fg = mgz.col_yellow },
		NotifyWARNBorder = { fg = mgz.col_purple },
		NotifyWARNIcon = { fg = mgz.col_purple },
		NotifyWARNTitle = { fg = mgz.col_purple },
	}

	-- Options :

	-- Set transparent background
	if vim.g.mgz_disable_background then
		editor.Normal = { fg = mgz.col_white, bg = mgz.none } -- Normal text and background color
		editor.SignColumn = { fg = mgz.col_purple, bg = mgz.none } -- Column left of the line number column
	else
		editor.Normal = { fg = mgz.col_white, bg = mgz.col_black }
		editor.SignColumn = { fg = mgz.col_purple, bg = mgz.col_black }
	end

	if vim.g.mgz_uniform_diff_background then
		editor.DiffAdd = { fg = mgz.col_teal, bg = mgz.col_dimblack }            -- diff mode: Added line
		editor.DiffChange = { fg = mgz.col_purple, bg = mgz.col_dimblack }       --  diff mode: Changed line
		editor.DiffDelete = { fg = mgz.col_red, bg = mgz.col_dimblack }          -- diff mode: Deleted line
		editor.DiffText = { fg = mgz.col_lightblue, bg = mgz.col_dimblack }      -- diff mode: Changed text within a changed line
	else
		editor.DiffAdd = { fg = mgz.col_teal, bg = mgz.none, style = "reverse" } -- diff mode: Added line
		editor.DiffChange = { fg = mgz.col_purple, bg = mgz.none, style = "reverse" } --  diff mode: Changed line
		editor.DiffDelete = { fg = mgz.col_red, bg = mgz.none, style = "reverse" } -- diff mode: Deleted line
		editor.DiffText = { fg = mgz.col_lightblue, bg = mgz.none, style = "reverse" } -- diff mode: Changed text within a changed line
	end

	return editor
end

theme.loadTerminal = function()
	vim.g.terminal_color_0 = mgz.col_dimblack
	vim.g.terminal_color_1 = mgz.col_red
	vim.g.terminal_color_2 = mgz.col_green
	vim.g.terminal_color_3 = mgz.col_orange
	vim.g.terminal_color_4 = mgz.col_blue
	vim.g.terminal_color_5 = mgz.col_purple
	vim.g.terminal_color_6 = mgz.col_cyan
	vim.g.terminal_color_7 = mgz.col_white
	vim.g.terminal_color_8 = mgz.col_dimwhite
	vim.g.terminal_color_9 = mgz.col_pink
	vim.g.terminal_color_10 = mgz.col_teal
	vim.g.terminal_color_11 = mgz.col_yellow
	vim.g.terminal_color_12 = mgz.col_darkblue
	vim.g.terminal_color_13 = mgz.col_purple
	vim.g.terminal_color_14 = mgz.col_dimcyan
	vim.g.terminal_color_15 = mgz.col_dimwhite
end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		-- TSAnnotation = { fg = mgz.col_green }, -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
		["@constructor"]                      = { fg = mgz.col_white },          -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		["@constant"]                         = { fg = mgz.col_purple },         -- For constants
		["@float"]                            = { fg = mgz.col_yellow },         -- For floats, eg 2.3e10
		["@number"]                           = { fg = mgz.col_teal },           -- For all number
		-- TSAttribute = { fg = mgz.col_yellow }, -- TODO: ?
		["@variable"]                         = { fg = mgz.col_lightblue },      -- Any user-defined variable's name that does not have another highlight.
		["@variable.builtin"]                 = { fg = mgz.col_blue },           -- Like console in console.log(), builtin to the language
		["@boolean"]                          = { fg = mgz.col_cyan },           -- For booleans.
		["@constant.builtin"]                 = { fg = mgz.col_pink, style = "bold" }, -- For constant that are built in the language: `nil` in Lua.
		["@constant.macro"]                   = { fg = mgz.col_pink, style = "bold" }, -- For constants that are defined by macros: `NULL` in C.
		-- TSError = { fg = mgz.col_red }, -- For syntax/parser errors. -- TODO: ?
		["@exception"]                        = { fg = mgz.col_yellow },         -- For exception related keywords.
		["@function.macro"]                   = { fg = mgz.col_pink },           -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		["@include"]                          = { fg = mgz.col_purple },         -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		["@label"]                            = { fg = mgz.col_lightblue },      -- For labels: `label:` in C and `:label:` in Lua. Example is also a key in JSON
		["@operator"]                         = { fg = mgz.col_yellow },         -- For any operator: `+`, but also `->` and `*` in C.
		["@parameter"]                        = { fg = mgz.col_lightblue },      -- For parameters of a function.
		-- TSParameterReference = { fg = mgz.col_lightblue }, -- For references to parameters of a function. -- TODO: ?
		["@punctuation.delimiter"]            = { fg = mgz.col_white },          -- For delimiters ie: `.`, `?`, `;`, `:`
		["@punctuation.bracket"]              = { fg = mgz.col_white },          -- For brackets and parens.
		["@punctuation.special"]              = { fg = mgz.col_purple },         -- For special punctuation that does not fall in the catagories before. Example is # in # H1 in .md

		-- TSSymbol = { fg = mgz.col_yellow }, -- For identifiers referring to symbols or atoms. -- TODO: ?
		["@type"]                             = { fg = mgz.col_blue },                               -- For types (user defined types, like type Person).
		["@type.builtin"]                     = { fg = mgz.col_blue },                               -- For builtin types (like number and string in typescript).
		["@tag"]                              = { fg = mgz.col_blue },                               -- Tags like html tag names.
		["@tag.delimiter"]                    = { fg = mgz.col_white },                              -- Tag delimiter like `<` `>` `/`. Example is <> in HTML tag.
		["@text"]                             = { fg = mgz.col_white },                              -- For strings considered text in a markup language. Example is normal text in HTML
		["@text.reference"]                   = { fg = mgz.col_green },                              -- References like image alt names in markdown (text inside of [])
		["@text.emphasis"]                    = { fg = mgz.col_pink, style = "italic" },             -- Italic text in markdown (*text*)
		["@text.strong"]                      = { fg = mgz.col_pink, style = "bold" },               -- Bold text in markdown (**text**)
		-- TSUnderline = { fg = mgz.col_blue, bg = mgz.none, style = "underline" }, -- For text to be represented with an underline. -- TODO: ?
		["@text.title"]                       = { fg = mgz.col_lightblue, bg = mgz.none, style = "bold" }, -- Text that is part of a title.
		["@text.literal"]                     = { fg = mgz.col_darkblue },                           -- Code in markdown (in `...` and ```...```)
		["@text.uri"]                         = { fg = mgz.col_darkblue, style = "underline" },      -- Any URI like a link or email.
		["@conditional"]                      = { fg = mgz.col_purple },                             -- For keywords related to conditionnals.
		["@function"]                         = { fg = mgz.col_pink },                               -- For fuction calls and definitions
		["@function.call"]                    = { fg = mgz.col_pink },                               -- There is a difference
		["@method"]                           = { fg = mgz.col_pink },                               -- For method calls and definitions
		["@function.builtin"]                 = { fg = mgz.col_pink },                               -- Builtin functions, like print() in Python
		["@namespace"]                        = { fg = mgz.col_blue },                               -- For identifiers referring to modules and namespaces.
		["@field"]                            = { fg = mgz.col_offblue },                            -- For fields in literals, for example this fg and col_... in this lua table here
		["@property"]                         = { fg = mgz.col_lightblue },                          -- Same as `TSField`
		["@keyword"]                          = { fg = mgz.col_darkblue },                           -- For keywords that don't fall in other categories.
		["@keyword.function"]                 = { fg = mgz.col_darkblue },                           -- def in Python
		["@keyword.return"]                   = { fg = mgz.col_purple },                             -- return in Python
		["@keyword.operator"]                 = { fg = mgz.col_green },                              -- A keyword operator, like new in new Object()
		["@repeat"]                           = { fg = mgz.col_purple },                             -- For keywords related to loops.
		["@string"]                           = { fg = mgz.col_teal },                               -- For strings.
		["@string.regex"]                     = { fg = mgz.col_pink },                               -- For regexes.
		["@string.escape"]                    = { fg = mgz.col_purple },                             -- For escape characters within a string, also the \ character in Markdown
		["@character"]                        = { fg = mgz.col_teal },                               -- For characters.

		-- TreeShitter introduced new groups for highlighting in comments.. yay..
		-- https://www.reddit.com/r/neovim/comments/19aratu/psa_nvimtreesitter_breaking_changes_on_highlight/
		-- Don't you just love breaking changes? Don't you love it when devs plan things ahead?
		["@comment"]                          = { fg = mgz.col_bluishgray },                           -- Comments
		["@comment.todo"]                     = { fg = mgz.col_black, bg = mgz.col_pink, style = "bold" }, -- TODO
		["@comment.note"]                     = { fg = mgz.col_black, bg = mgz.col_blue, style = "bold" }, -- NOTE, INFO and XXX
		["@comment.error"]                    = { fg = mgz.col_black, bg = mgz.col_red, style = "bold" }, -- FIXME and BUG
		["@comment.warning"]                  = { fg = mgz.col_black, bg = mgz.col_orange, style = "bold" }, -- WARN and WARNING
		-- Markdown (Markup) Specific (Copied over from material.nvim and tokyonight.nvim (TODO: Remove this comment))
		-- Comment out if you stop working on this
		["@markup.underline"]                 = { underline = true },
		["@markup.emphasis"]                  = { italic = true },
		["@markup.strong"]                    = { bold = true },
		["@markup.strikethrough"]             = { strikethrough = true },
		["@markup.title"]                     = { fg = mgz.cyan, bold = true },
		["@markup.literal"]                   = { fg = mgz.green },
		-- URL links (like [something](https://www.google.com))
		["@markup.link"]                      = { fg = mgz.col_blue }, -- Links, text references, footnotes, citations, etc.
		["@markup.link.url"]                  = { style = "underline" }, -- Only links are underlined
		["@markup.link.label"]                = { fg = mgz.col_teal }, -- The color of "something" in [something](www.google.com)
		["@markup.link.label.symbol"]         = { link = "Identifier" }, -- TODO ???
		["@markup.link.unchecked"]            = { fg = mgz.col_pink }, -- TODO ???
		["@markup.math"]                      = { fg = mgz.blue }, -- e.g. LaTeX math
		["@markup.list"]                      = { link = "Special" },
		["@markup.list.checked"]              = { fg = mgz.green }, -- checkboxes
		["@markup.list.unchecked"]            = { fg = mgz.text },
		["@markup.environment"]               = { fg = mgz.red },
		["@markup.environment.name"]          = { fg = mgz.red },
		["@markup.warning"]                   = { fg = mgz.warning },
		["@markup.danger"]                    = { fg = mgz.error },
		["@markup.raw"]                       = { fg = mgz.col_purple },                   -- ``` ``` and ` ` in markdown code (as far as I can tell)
		["@markup.raw.markdown_inline"]       = { link = "markdownCode" }, -- Actual inline code in markdown
		-- Headings text
		["@markup.heading.1.markdown"]        = { link = "markdownH1" },
		["@markup.heading.2.markdown"]        = { link = "markdownH2" },
		["@markup.heading.3.markdown"]        = { link = "markdownH3" },
		["@markup.heading.4.markdown"]        = { link = "markdownH4" },
		["@markup.heading.5.markdown"]        = { link = "markdownH5" },
		["@markup.heading.6.markdown"]        = { link = "markdownH6" },
		-- Headings markers (###)
		["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },
	}

	if vim.g.mgz_italic == true then
		-- TODO: Change over to ["@"] syntax
		treesitter.TSComment = { fg = mgz.col_bluishgray, style = "italic" } -- Italic comments
	end

	return treesitter
end

theme.loadLSP = function()
	-- Lsp highlight groups

	local lsp = {
		LspDiagnosticsDefaultError = { fg = mgz.col_red, bg = mgz.col_dimred, style = "italic" },            -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = mgz.col_red },                                                      -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = mgz.col_red, bg = mgz.col_dimred, style = "italic" },           -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = mgz.col_red, bg = mgz.col_dimred, style = "italic" },        -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = mgz.col_red },                            -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning = { fg = mgz.col_yellow, bg = mgz.col_dimyellow, style = "italic" },    -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = mgz.col_yellow },                                                 -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = mgz.col_yellow, bg = mgz.col_dimyellow, style = "italic" },   -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = mgz.col_yellow, bg = mgz.col_dimyellow, style = "italic" }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = mgz.col_yellow },                       -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation = { fg = mgz.col_lightblue, bg = mgz.col_dimblue, style = "italic" }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = mgz.col_lightblue },                                          -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = mgz.col_lightblue, bg = mgz.col_dimblue, style = "italic" }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = mgz.col_lightblue, bg = mgz.col_dimblue, style = "italic" }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = mgz.col_lightblue },                -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint = { fg = mgz.col_cyan, bg = mgz.col_dimcyan, style = "italic" },           -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = mgz.col_cyan },                                                      -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = mgz.col_cyan, bg = mgz.col_dimcyan, style = "italic" },          -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = mgz.col_cyan, bg = mgz.col_dimcyan, style = "italic" },       -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = mgz.col_lightblue },                       -- used to underline "Hint" diagnostics.
		LspReferenceText = { fg = mgz.col_blue, bg = mgz.col_dimblack },                                     -- used for highlighting "text" references
		LspReferenceRead = { fg = mgz.col_blue, bg = mgz.col_dimblack },                                     -- used for highlighting "read" references
		LspReferenceWrite = { fg = mgz.col_blue, bg = mgz.col_dimblack },                                    -- used for highlighting "write" references

		DiagnosticError = { link = "LspDiagnosticsDefaultError" },
		DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
		DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
		DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
		DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
		DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
		DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
		DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
		DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
		DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
		DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
		DiagnosticSignError = { link = "LspDiagnosticsSignError" },
		DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
		DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
		DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
		DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
		DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
		DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
		DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
		DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
	}

	return lsp
end

theme.loadPlugins = function() -- Plugins highlight groups
	local plugins = {

		-- LuaLine is in another file

		-- BufferLine -- CokeLine is an alternative, but badly configured in terms of theming.
		BufferLineBufferSelected = { fg = mgz.col_cyan, bg = mgz.none, italic = "false" },           -- Selected buffer text and bg
		BufferLineModified = { fg = mgz.col_yellow, bg = mgz.none, gui = "bold", style = "bold" },   -- Indicator (dot) that the buffer has been modified
		BufferLineModifiedSelected = { fg = mgz.col_yellow, bg = mgz.none, gui = "bold", style = "bold" }, -- Same, but for selected buffer
		-- BufferLineBackground = { fg = mgz.col_gray, bg = mgz.col_diminbetween }, -- Unselected buffer text and bg
		-- BufferLineIndicatorSelected = { fg = mgz.col_white, bg = mgz.col_dimwhite }, -- The indicator (leftmost) for the selected buffer
		-- BufferLineFill = { fg = mgz.none, bg = mgz.col_darkgray }, -- BufferLine background, for the BufferLine itself, not counting the tabs
		-- BufferLineSeparator = { fg = mgz.col_dimblack, bg = mgz.col_dimblack }, -- Separator between tabs, fg is the tiny line, bg is the background
		-- DevIcons seem to be styled dynamically, see this https://github.com/akinsho/bufferline.nvim/issues/627 if you're interested

		-- NvimScrollbar -- For some reason it can't be set here, so it's set in the lua config file of the plugin

		-- TODO: Lazy Plugin Manager
		-- LazyButton = { fg = mgz., bg = mgz., gui = "bold", style = "bold" }, -- Install, Update, Sync buttons
		-- LazyButtonActive = { fg = mgz., bg = mgz., gui = "bold", style = "bold" }, -- Install, Update, Sync buttons when active
		-- LazySpecial = { fg = mgz., bg = mgz., gui = "bold", style = "bold" }, -- Dots next to loaded plugins and button shortcuts
		-- etc

		-- Diff
		diffAdded = { fg = mgz.col_teal },
		diffRemoved = { fg = mgz.col_red },
		diffChanged = { fg = mgz.col_lightblue },
		diffOldFile = { fg = mgz.col_yellow },
		diffNewFile = { fg = mgz.col_green },
		diffFile = { fg = mgz.col_pink },
		diffLine = { fg = mgz.col_dimwhite },
		diffIndexLine = { fg = mgz.col_white },

		-- Neogit
		NeogitBranch = { fg = mgz.col_lightblue },
		NeogitRemote = { fg = mgz.col_white },
		NeogitHunkHeader = { fg = mgz.col_orange },
		NeogitHunkHeaderHighlight = { fg = mgz.col_orange, bg = mgz.col_dimblack },
		NeogitDiffContextHighlight = { bg = mgz.col_dimblack },
		NeogitDiffDeleteHighlight = { fg = mgz.col_red, style = "reverse" },
		NeogitDiffAddHighlight = { fg = mgz.col_teal, style = "reverse" },

		-- GitGutter
		GitGutterAdd = { fg = mgz.col_teal },   -- diff mode: Added line
		GitGutterChange = { fg = mgz.col_lightblue }, -- diff mode: Changed line
		GitGutterDelete = { fg = mgz.col_red }, -- diff mode: Deleted line

		-- GitSigns
		GitSignsAdd = { fg = mgz.col_teal },     -- diff mode: Added line
		GitSignsAddNr = { fg = mgz.col_teal },   -- diff mode: Added line
		GitSignsAddLn = { fg = mgz.col_teal },   -- diff mode: Added line
		GitSignsChange = { fg = mgz.col_lightblue }, -- diff mode: Changed line
		GitSignsChangeNr = { fg = mgz.col_lightblue }, -- diff mode: Changed line
		GitSignsChangeLn = { fg = mgz.col_lightblue }, -- diff mode: Changed line
		GitSignsDelete = { fg = mgz.col_red },   -- diff mode: Deleted line
		GitSignsDeleteNr = { fg = mgz.col_red }, -- diff mode: Deleted line
		GitSignsDeleteLn = { fg = mgz.col_red }, -- diff mode: Deleted line
		GitSignsCurrentLineBlame = { fg = mgz.col_bluishgray, style = "bold" },

		-- Folke's Flash.nvim
		FlashBackdrop = { fg = mgz.col_fives },                                     -- Color of text that is search-able with a jump (default is gray-ish) (when pressing just 'f')
		FlashMatch = { fg = mgz.col_black, bg = mgz.col_lightblue, style = "bold" }, -- On a standalone .jump(), the color of the other matches
		FlashCurrent = { fg = mgz.col_black, bg = mgz.col_green, style = "bold" },  -- On a standalone .jump(), the color of the current match
		FlashLabel = { fg = mgz.col_lightblue, bg = mgz.col_dimmagenta, style = "bold" }, -- Jump label color
		-- TODO:
		-- FlashPrompt, FlashPromptIcon, FlashCursor

		-- Telescope
		TelescopePromptBorder = { fg = mgz.col_teal },
		TelescopeResultsBorder = { fg = mgz.col_white },
		TelescopePreviewBorder = { fg = mgz.col_white },
		TelescopeSelectionCaret = { fg = mgz.col_teal, style = "bold" },
		TelescopeSelection = { fg = mgz.col_white, bg = mgz.col_dimblack },
		TelescopeMatching = { fg = mgz.col_orange, style = "bold" },
		TelescopePromptCounter = { fg = mgz.col_gray },

		-- NvimTree
		-- For NvimTreeNormal, go down to the end of this file
		NvimTreeRootFolder = { fg = mgz.col_white, style = "bold" }, -- At the top of NvimTree
		NvimTreeGitDirty = { fg = mgz.col_lightblue },         -- A git file with changes
		NvimTreeGitNew = { fg = mgz.col_teal },                -- A new git file, not yet tracked
		NvimTreeGitStaged = { fg = mgz.col_teal },             -- A git file that has been staged
		NvimTreeImageFile = { fg = mgz.col_yellow },
		NvimTreeExecFile = { fg = mgz.col_teal },
		NvimTreeSpecialFile = { fg = mgz.col_orange },
		NvimTreeFolderName = { fg = mgz.col_lightblue, style = "bold" },
		NvimTreeOpenedFolderName = { fg = mgz.col_lightblue, style = "bold" },
		NvimTreeEmptyFolderName = { fg = mgz.col_bluishgray, style = "bold" },
		NvimTreeFolderIcon = { fg = mgz.col_lightblue },
		NvimTreeIndentMarker = { fg = mgz.col_bluishgray },
		NvimTreeWindowPicker = { fg = mgz.col_black, bg = mgz.col_orange, style = "bold" }, -- Color of status line of window that you pick when opening a file from NvimTree when you have multiple windows (panes) open in nvim

		LspDiagnosticsError = { fg = mgz.col_red },
		LspDiagnosticsWarning = { fg = mgz.col_yellow },
		LspDiagnosticsInformation = { fg = mgz.col_lightblue },
		LspDiagnosticsHint = { fg = mgz.col_white },

		-- WhichKey
		WhichKey = { fg = mgz.col_blue, style = "bold" },  -- The key on the left
		WhichKeyDesc = { fg = mgz.col_white, style = "italic" }, -- Description of shortcut
		WhichKeySeparator = { fg = mgz.col_purple },       -- The arrow. And it's not sepErator.
		WhichKeyFloat = { bg = mgz.col_dimblack },
		WhichKeyFloating = { bg = mgz.col_dimblack },
		WhichKeyGroup = { fg = mgz.col_teal },
		-- WhichKeyBorder = ?
		-- WhichKeyValue = ?

		-- LspSaga
		DiagnosticError = { fg = mgz.col_red },
		DiagnosticWarning = { fg = mgz.col_yellow },
		DiagnosticInformation = { fg = mgz.col_lightblue },
		DiagnosticHint = { fg = mgz.col_white },
		DiagnosticTruncateLine = { fg = mgz.col_blue },
		LspFloatWinNormal = { bg = mgz.col_darkgray },
		LspFloatWinBorder = { fg = mgz.col_white },
		LspSagaBorderTitle = { fg = mgz.col_orange },
		LspSagaHoverBorder = { fg = mgz.col_lightblue },
		LspSagaRenameBorder = { fg = mgz.col_teal },
		LspSagaDefPreviewBorder = { fg = mgz.col_teal },
		LspSagaCodeActionBorder = { fg = mgz.col_pink },
		LspSagaFinderSelection = { fg = mgz.col_teal },
		LspSagaCodeActionTitle = { fg = mgz.col_lightblue },
		LspSagaCodeActionContent = { fg = mgz.col_white },
		LspSagaSignatureHelpBorder = { fg = mgz.col_purple },
		ReferencesCount = { fg = mgz.col_white },
		DefinitionCount = { fg = mgz.col_white },
		DefinitionIcon = { fg = mgz.col_pink },
		ReferencesIcon = { fg = mgz.col_pink },
		TargetWord = { fg = mgz.col_orange },

		-- Sneak
		Sneak = { fg = mgz.col_black, bg = mgz.col_blue },
		SneakScope = { bg = mgz.col_dimblack },

		-- Cmp (completion engine plugin)
		CmpItemKind = { fg = mgz.col_gray }, -- Completion source, general color (shouldn't be seen if others done correctly)
		CmpItemKindTypeParameter = {},
		CmpItemKindConstructor = {},
		CmpItemKindEnumMember = {},
		CmpItemKindReference = {},
		CmpItemKindInterface = {},
		CmpItemKindVariable = { fg = mgz.col_blue },
		CmpItemKindProperty = { fg = mgz.col_purple },
		CmpItemKindOperator = {},
		CmpItemKindFunction = { fg = mgz.col_pink }, -- Different from method
		CmpItemKindConstant = { fg = mgz.col_teal },
		CmpItemKindSnippet = { fg = mgz.col_yellow },
		CmpItemKindKeyword = { fg = mgz.col_purple },
		CmpItemKindType = {},
		CmpItemKindStruct = {},
		CmpItemKindModule = { fg = mgz.col_orange },
		CmpItemKindMethod = { fg = mgz.col_pink }, -- Different from function
		CmpItemKindFolder = {},
		CmpItemKindValue = {},
		CmpItemKindField = { fg = mgz.col_lightblue },
		CmpItemKindEvent = {},
		CmpItemKindColor = {},
		CmpItemKindClass = { fg = mgz.col_teal },
		CmpItemKindUnit = {},
		CmpItemKindText = { fg = mgz.col_white },
		CmpItemKindFile = {},
		CmpItemKindEnum = { fg = mgz.col_orange },
		CmpItemAbbrMatch = { fg = mgz.col_blue, style = "bold" },  -- Literal match for completion item
		CmpItemAbbrMatchFuzzy = { fg = mgz.col_orange, style = "bold" }, -- Fuzzy found match for completion item
		CmpItemAbbr = { fg = mgz.col_gray },                       -- Text of completion item
		CmpItemMenu = { fg = mgz.col_teal },                       -- ???

		-- Indent Blankline (see :help ibl.highlights)
		-- TODO: v3 is released, and this needs an update
		-- Look at tags with 'ibl' in the name, by default they take the NonText highlight group (the @@@, see above)
		-- Those are hl-IblIndent, hl-IblWhitespace, hl-IblScope, and 4 more that start with @, and changing those 4 actually does make a difference


		-- Illuminate
		illuminatedWord = { bg = mgz.col_dimwhite },
		illuminatedCurWord = { bg = mgz.col_dimwhite },

		-- nvim-dap
		DapBreakpoint = { fg = mgz.col_teal },
		DapStopped = { fg = mgz.col_yellow },

		-- nvim-dap-ui
		DapUIVariable = { fg = mgz.col_blue },
		DapUIScope = { fg = mgz.col_orange },
		DapUIType = { fg = mgz.col_blue },
		DapUIValue = { fg = mgz.col_blue },
		DapUIModifiedValue = { fg = mgz.col_orange },
		DapUIDecoration = { fg = mgz.col_orange },
		DapUIThread = { fg = mgz.col_orange },
		DapUIStoppedThread = { fg = mgz.col_orange },
		DapUIFrameName = { fg = mgz.col_blue },
		DapUISource = { fg = mgz.col_white },
		DapUILineNumber = { fg = mgz.col_orange },
		DapUIFloatBorder = { fg = mgz.col_orange },
		DapUIWatchesEmpty = { fg = mgz.col_red },
		DapUIWatchesValue = { fg = mgz.col_orange },
		DapUIWatchesError = { fg = mgz.col_red },
		DapUIBreakpointsPath = { fg = mgz.col_orange },
		DapUIBreakpointsInfo = { fg = mgz.col_orange },
		DapUIBreakpointsCurrentLine = { fg = mgz.col_orange },
		DapUIBreakpointsLine = { fg = mgz.col_orange },

		-- Fern
		FernBranchText = { fg = mgz.col_bluishgray },

		-- nvim-ts-rainbow
		rainbowcol1 = { fg = mgz.col_yellow },
		rainbowcol2 = { fg = mgz.col_purple },
		rainbowcol3 = { fg = mgz.col_red },
		rainbowcol4 = { fg = mgz.col_pink },
		rainbowcol5 = { fg = mgz.col_orange },
		rainbowcol6 = { fg = mgz.col_yellow },
		rainbowcol7 = { fg = mgz.col_purple },

		-- lightspeed
		LightspeedLabel = { fg = mgz.col_orange, style = "bold" },
		LightspeedLabelOverlapped = { fg = mgz.col_orange, style = "bold,underline" },
		LightspeedLabelDistant = { fg = mgz.col_yellow, style = "bold" },
		LightspeedLabelDistantOverlapped = { fg = mgz.col_yellow, style = "bold,underline" },
		LightspeedShortcut = { fg = mgz.col_lightblue, style = "bold" },
		LightspeedShortcutOverlapped = { fg = mgz.col_lightblue, style = "bold,underline" },
		LightspeedMaskedChar = { fg = mgz.col_blue, bg = mgz.col_darkgray, style = "bold" },
		LightspeedGreyWash = { fg = mgz.col_bluishgray },
		LightspeedUnlabeledMatch = { fg = mgz.col_blue, bg = mgz.col_dimblack },
		LightspeedOneCharMatch = { fg = mgz.col_orange, style = "bold,reverse" },
		LightspeedUniqueChar = { style = "bold,underline" },

		-- Copilot
		CopilotSuggestion = { fg = mgz.col_fours, bg = mgz.none },
		CopilotAnnotation = { fg = mgz.col_fours, bg = mgz.none },
		CopilotLabel = { fg = mgz.col_fours, bg = mgz.none },

		-- Statusline
		StatusLineDull = { fg = mgz.col_dimwhite, bg = mgz.col_dimblack },
		StatusLineAccent = { fg = mgz.col_black, bg = mgz.col_purple },
	}

	return plugins
end

return theme

-- I hate treeshitter so much
