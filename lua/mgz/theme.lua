local mgz = {
	-- Colors need to be in '#rrggbb', not '#rgb'
	-- #ff765e is a nice color

	col_black = "#000000", -- background
	col_verydarkgray = "#111111", -- current line highlight, scrollbar, lualine middle
	col_darkgray = "#1b1b1b", -- lualine inner and selection (visual mode) background
	col_gray = "#333333", -- vertical lines on tabs
	col_bluishgray = "#658595", -- comments, line numbers
	col_blue = "#1babff", -- console in console.log(), lualine outer (insert mode), commands, text in middle of lualine, WHOLE BUNCHA SHIT
	col_darkblue = "#4e79f0" -- storage, keywords (like let, const, interface)
	col_termcursor = "#ffffff", -- lualine file type, toggleterm block cursor
	col_huh = "#ffffff", -- ???
	col_pink = "#ff6176", -- methods of objects, lualine outer (visual mode)
	col_orange = "#df6f3f", -- function names, WHOLE BUNCHA SHIT
	col_white = "#ffffff", -- ifs, elses, {}=, all the brackets, lualine outer (normal mode), WHOLE BUNCHA SHIT - #658595
	col_lightblue = "#8edfff", -- object fields
	col_red = "#ff3333", -- lsp errors - #ff3854
	col_stronggreen = "#00ff00", -- ??? very rarely used
	col_purple = "#a25dfc", -- !DOCTYPE html, TODO color
	col_teal = "#58F5AB", -- string
	col_yellow = "#f4da58", -- numbers
	col_liminal = "#2adede", -- constants, booleans
	none = "NONE",
}

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.mgz_contrast then
	mgz.sidebar = mgz.col_verydarkgray
	mgz.float = mgz.col_verydarkgray
else
	mgz.sidebar = mgz.col_black
	mgz.float = mgz.col_black
end

if vim.g.mgz_cursorline_transparent then
	mgz.cursorlinefg = mgz.col_black
else
	mgz.cursorlinefg = mgz.col_verydarkgray
end

local theme = {}

theme.loadSyntax = function()
	-- Syntax highlight groups

	local syntax = {
		Type = { fg = mgz.col_blue }, -- int, long, char, etc.
		StorageClass = { fg = mgz.col_white }, -- static, register, volatile, etc.
		Structure = { fg = mgz.col_white }, -- struct, union, enum, etc.
		Constant = { fg = mgz.col_blue }, -- any constant
		Character = { fg = mgz.col_teal }, -- any character constant: 'c', '\n'
		Number = { fg = mgz.col_yellow }, -- a number constant: 5
		Boolean = { fg = mgz.col_liminal }, -- a boolean constant: TRUE, false
		Float = { fg = mgz.col_yellow }, -- a floating point constant: 2.3e10
		Statement = { fg = mgz.col_white }, -- any statement
		Label = { fg = mgz.col_white }, -- case, default, etc.
		Operator = { fg = mgz.col_white }, -- sizeof", "+", "*", etc.
		Exception = { fg = mgz.col_white }, -- try, catch, throw
		PreProc = { fg = mgz.col_white }, -- generic Preprocessor
		Include = { fg = mgz.col_white }, -- preprocessor #include
		Define = { fg = mgz.col_white }, -- preprocessor #define
		Macro = { fg = mgz.col_white }, -- same as Define
		Typedef = { fg = mgz.col_white }, -- A typedef
		PreCondit = { fg = mgz.col_purple }, -- preprocessor #if, #else, #endif, etc.
		Special = { fg = mgz.col_blue }, -- any special symbol
		SpecialChar = { fg = mgz.col_purple }, -- special character in a constant
		Tag = { fg = mgz.col_blue }, -- you can use CTRL-] on this
		Delimiter = { fg = mgz.col_huh }, -- character that needs attention like , or .
		SpecialComment = { fg = mgz.col_orange }, -- special things inside a comment
		Debug = { fg = mgz.col_red }, -- debugging statements
		Underlined = { fg = mgz.col_teal, bg = mgz.none, style = "underline" }, -- text that stands out, HTML links
		Ignore = { fg = mgz.col_verydarkgray }, -- left blank, hidden
		Error = { fg = mgz.col_red, bg = mgz.none, style = "bold,underline" }, -- any erroneous construct
		Todo = { fg = mgz.col_purple, bg = mgz.none, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Conceal = { fg = mgz.none, bg = mgz.col_black },

		htmlLink = { fg = mgz.col_teal, style = "underline" },
		htmlH1 = { fg = mgz.col_orange, style = "bold" },
		htmlH2 = { fg = mgz.col_red, style = "bold" },
		htmlH3 = { fg = mgz.col_teal, style = "bold" },
		htmlH4 = { fg = mgz.col_yellow, style = "bold" },
		htmlH5 = { fg = mgz.col_white, style = "bold" },
		markdownH1 = { fg = mgz.col_orange, style = "bold" },
		markdownH2 = { fg = mgz.col_red, style = "bold" },
		markdownH3 = { fg = mgz.col_teal, style = "bold" },
		markdownH1Delimiter = { fg = mgz.col_orange },
		markdownH2Delimiter = { fg = mgz.col_red },
		markdownH3Delimiter = { fg = mgz.col_teal },
	}

	-- Italic check
	if vim.g.mgz_italic == false then
		syntax.Comment = { fg = mgz.col_bluishgray } -- normal comments
		syntax.Conditional = { fg = mgz.col_white } -- normal if, then, else, endif, switch, etc.
		syntax.Function = { fg = mgz.col_orange } -- normal function names
		syntax.Identifier = { fg = mgz.col_white } -- any variable name
		syntax.Keyword = { fg = mgz.col_darkblue } -- normal for, do, while, etc.
		syntax.Repeat = { fg = mgz.col_white } -- normal any other keyword
		syntax.String = { fg = mgz.col_teal } -- any string
	else
		syntax.Comment = { fg = mgz.col_bluishgray, bg = mgz.none, style = "italic" } -- italic comments
		syntax.Conditional = { fg = mgz.col_white, bg = mgz.none, style = "italic" } -- italic if, then, else, endif, switch, etc.
		syntax.Function = { fg = mgz.col_orange, bg = mgz.none, style = "italic" } -- italic funtion names
		syntax.Identifier = { fg = mgz.col_white, bg = mgz.none, style = "italic" } -- any variable name
		syntax.Keyword = { fg = mgz.col_white, bg = mgz.none, style = "italic" } -- italic for, do, while, etc.
		syntax.Repeat = { fg = mgz.col_white, bg = mgz.none, style = "italic" } -- italic any other keyword
		syntax.String = { fg = mgz.col_teal, bg = mgz.none, style = "italic" } -- any string
	end

	return syntax
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {
		NormalFloat = { fg = mgz.col_blue, bg = mgz.float }, -- normal text and background color
		FloatBorder = { fg = mgz.col_blue, bg = mgz.float }, -- normal text and background color
		ColorColumn = { fg = mgz.none, bg = mgz.col_verydarkgray }, --  used for the columns set with 'colorcolumn'
		Conceal = { fg = mgz.col_verydarkgray }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = mgz.col_blue, bg = mgz.none, style = "reverse" }, -- the character under the cursor
		CursorIM = { fg = mgz.col_termcursor, bg = mgz.none, style = "reverse" }, -- like Cursor, but used when in IME mode
		Directory = { fg = mgz.col_pink, bg = mgz.none }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = mgz.col_verydarkgray },
		ErrorMsg = { fg = mgz.none },
		Folded = { fg = mgz.col_bluishgray, bg = mgz.none, style = "italic" },
		FoldColumn = { fg = mgz.col_pink },
		IncSearch = { fg = mgz.col_black, bg = mgz.col_orange }, -- Search with /
		LineNr = { fg = mgz.col_bluishgray },
		CursorLineNr = { fg = mgz.col_blue },
		MatchParen = { fg = mgz.col_yellow, bg = mgz.none, style = "bold" },
		ModeMsg = { fg = mgz.col_blue },
		MoreMsg = { fg = mgz.col_blue },
		NonText = { fg = mgz.col_verydarkgray },
		Pmenu = { fg = mgz.col_blue, bg = mgz.col_darkgray },
		PmenuSel = { fg = mgz.col_blue, bg = mgz.col_lightblue },
		PmenuSbar = { fg = mgz.col_blue, bg = mgz.col_darkgray },
		PmenuThumb = { fg = mgz.col_blue, bg = mgz.col_blue },
		Question = { fg = mgz.col_teal },
		QuickFixLine = { fg = mgz.col_blue, bg = mgz.none, style = "reverse" },
		qfLineNr = { fg = mgz.col_blue, bg = mgz.none, style = "reverse" },
		Search = { fg = mgz.col_black, bg = mgz.col_orange, style = "reverse" }, -- Search with ???
		SpecialKey = { fg = mgz.col_white },
		SpellBad = { fg = mgz.col_red, bg = mgz.none, style = "italic,undercurl" },
		SpellCap = { fg = mgz.col_pink, bg = mgz.none, style = "italic,undercurl" },
		SpellLocal = { fg = mgz.col_orange, bg = mgz.none, style = "italic,undercurl" },
		SpellRare = { fg = mgz.col_white, bg = mgz.none, style = "italic,undercurl" },
		StatusLine = { fg = mgz.col_blue, bg = mgz.col_darkgray },
		StatusLineNC = { fg = mgz.col_blue, bg = mgz.col_verydarkgray },
		StatusLineTerm = { fg = mgz.col_blue, bg = mgz.col_darkgray },
		StatusLineTermNC = { fg = mgz.col_blue, bg = mgz.col_verydarkgray },
		TabLineFill = { fg = mgz.col_blue, bg = mgz.none },
		TablineSel = { fg = mgz.col_verydarkgray, bg = mgz.col_white },
		Tabline = { fg = mgz.col_blue, bg = mgz.col_verydarkgray },
		Title = { fg = mgz.col_teal, bg = mgz.none, style = "bold" },
		Visual = { fg = mgz.none, bg = mgz.col_darkgray },
		VisualNOS = { fg = mgz.none, bg = mgz.col_darkgray },
		WarningMsg = { fg = mgz.col_yellow },
		WildMenu = { fg = mgz.col_stronggreen, bg = mgz.none, style = "bold" },
		CursorColumn = { fg = mgz.none, bg = mgz.cursorlinefg },
		CursorLine = { fg = mgz.none, bg = mgz.cursorlinefg },
		ToolbarLine = { fg = mgz.col_blue, bg = mgz.col_verydarkgray },
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

		-- Barbar
		BufferTabpageFill = { bg = mgz.col_black },

		BufferCurrent = { bg = mgz.col_verydarkgray },
		BufferCurrentMod = { bg = mgz.col_verydarkgray, fg = mgz.col_yellow },
		BufferCurrentIcon = { bg = mgz.col_verydarkgray },
		BufferCurrentSign = { bg = mgz.col_verydarkgray },
		BufferCurrentIndex = { bg = mgz.col_verydarkgray },
		BufferCurrentTarget = { bg = mgz.col_verydarkgray, fg = mgz.col_red },

		BufferInactive = { bg = mgz.col_black, fg = mgz.col_gray },
		BufferInactiveMod = { bg = mgz.col_black, fg = mgz.col_yellow },
		BufferInactiveIcon = { bg = mgz.col_black , fg = mgz.col_gray },
		BufferInactiveSign = { bg = mgz.col_black , fg = mgz.col_gray },
		BufferInactiveIndex = { bg = mgz.col_black , fg = mgz.col_gray },
		BufferInactiveTarget = { bg = mgz.col_black, fg = mgz.col_red },

		BufferVisible = { bg = mgz.col_darkgray },
		BufferVisibleMod = { bg = mgz.col_darkgray, fg = mgz.col_yellow },
		BufferVisibleIcon = { bg = mgz.col_darkgray },
		BufferVisibleSign = { bg = mgz.col_darkgray },
		BufferVisibleIndex = { bg = mgz.col_darkgray },
		BufferVisibleTarget = { bg = mgz.col_darkgray, fg = mgz.col_red },

		-- nvim-notify
		NotifyDEBUGBorder = { fg = mgz.col_gray },
		NotifyDEBUGIcon = { fg = mgz.col_gray },
		NotifyDEBUGTitle = { fg = mgz.col_gray },
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

		-- leap.nvim
		LeapMatch = { style="underline,nocombine", fg=mgz.col_purple },
		LeapLabelPrimary = { style="nocombine", fg=mgz.col_black, bg=mgz.col_purple },
		LeapLabelSecondary = { style="nocombine", fg=mgz.col_black, bg=mgz.col_yellow },
	}

	-- Options:

	--Set transparent background
	if vim.g.mgz_disable_background then
		editor.Normal = { fg = mgz.col_blue, bg = mgz.none } -- normal text and background color
		editor.SignColumn = { fg = mgz.col_blue, bg = mgz.none }
	else
		editor.Normal = { fg = mgz.col_blue, bg = mgz.col_black } -- normal text and background color
		editor.SignColumn = { fg = mgz.col_blue, bg = mgz.col_black }
	end

	-- Remove window split borders
	if vim.g.mgz_borders then
		editor.VertSplit = { fg = mgz.col_darkgray }
	else
		editor.VertSplit = { fg = mgz.col_black }
	end

	if vim.g.mgz_uniform_diff_background then
		editor.DiffAdd = { fg = mgz.col_teal, bg = mgz.col_verydarkgray } -- diff mode: Added line
		editor.DiffChange = { fg = mgz.col_purple, bg = mgz.col_verydarkgray } --  diff mode: Changed line
		editor.DiffDelete = { fg = mgz.col_red, bg = mgz.col_verydarkgray } -- diff mode: Deleted line
		editor.DiffText = { fg = mgz.col_yellow, bg = mgz.col_verydarkgray } -- diff mode: Changed text within a changed line
	else
		editor.DiffAdd = { fg = mgz.col_teal, bg = mgz.none, style = "reverse" } -- diff mode: Added line
		editor.DiffChange = { fg = mgz.col_purple, bg = mgz.none, style = "reverse" } --  diff mode: Changed line
		editor.DiffDelete = { fg = mgz.col_red, bg = mgz.none, style = "reverse" } -- diff mode: Deleted line
		editor.DiffText = { fg = mgz.col_yellow, bg = mgz.none, style = "reverse" } -- diff mode: Changed text within a changed line
	end

	return editor
end

theme.loadTerminal = function()
	vim.g.terminal_color_0 = mgz.col_verydarkgray
	vim.g.terminal_color_1 = mgz.col_red
	vim.g.terminal_color_2 = mgz.col_teal
	vim.g.terminal_color_3 = mgz.col_purple
	vim.g.terminal_color_4 = mgz.col_white
	vim.g.terminal_color_5 = mgz.col_yellow
	vim.g.terminal_color_6 = mgz.col_orange
	vim.g.terminal_color_7 = mgz.col_termcursor
	vim.g.terminal_color_8 = mgz.col_gray
	vim.g.terminal_color_9 = mgz.col_red
	vim.g.terminal_color_10 = mgz.col_teal
	vim.g.terminal_color_11 = mgz.col_purple
	vim.g.terminal_color_12 = mgz.col_white
	vim.g.terminal_color_13 = mgz.col_yellow
	vim.g.terminal_color_14 = mgz.col_pink
	vim.g.terminal_color_15 = mgz.col_huh
end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		TSAnnotation = { fg = mgz.col_stronggreen }, -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
		TSConstructor = { fg = mgz.col_white }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		TSConstant = { fg = mgz.col_purple }, -- For constants
		TSFloat = { fg = mgz.col_yellow }, -- For floats
		TSNumber = { fg = mgz.col_yellow }, -- For all number

		TSAttribute = { fg = mgz.col_yellow }, -- (unstable) TODO: docs
		TSVariable = { fg = mgz.col_lightblue }, -- Any variable name that does not have another highlight.
		TSVariableBuiltin = { fg = mgz.col_lightblue },
		TSBoolean = { fg = mgz.col_liminal }, -- For booleans.
		TSConstBuiltin = { fg = mgz.col_pink, style = "bold" }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro = { fg = mgz.col_pink, style = "bold" }, -- For constants that are defined by macros: `NULL` in C.
		TSError = { fg = mgz.col_red }, -- For syntax/parser errors.
		TSException = { fg = mgz.col_yellow }, -- For exception related keywords.
		TSFuncMacro = { fg = mgz.col_pink }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = mgz.col_white }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSLabel = { fg = mgz.col_yellow }, -- For labels: `label:` in C and `:label:` in Lua.
		TSOperator = { fg = mgz.col_white }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = mgz.col_lightblue }, -- For parameters of a function.
		TSParameterReference = { fg = mgz.col_lightblue }, -- For references to parameters of a function.
		TSPunctDelimiter = { fg = mgz.col_orange }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = mgz.col_orange }, -- For brackets and parens.
		TSPunctSpecial = { fg = mgz.col_orange }, -- For special punctutation that does not fall in the catagories before.
		TSSymbol = { fg = mgz.col_yellow }, -- For identifiers referring to symbols or atoms.
		TSType = { fg = mgz.col_white }, -- For types.
		TSTypeBuiltin = { fg = mgz.col_white }, -- For builtin types.
		TSTag = { fg = mgz.col_blue }, -- Tags like html tag names.
		TSTagDelimiter = { fg = mgz.col_yellow }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = mgz.col_blue }, -- For strings considecol_red text in a markup language.
		TSTextReference = { fg = mgz.col_yellow }, -- FIXME
		TSEmphasis = { fg = mgz.col_lightblue }, -- For text to be represented with emphasis.
		TSUnderline = { fg = mgz.col_blue, bg = mgz.none, style = "underline" }, -- For text to be represented with an underline.
		TSTitle = { fg = mgz.col_lightblue, bg = mgz.none, style = "bold" }, -- Text that is part of a title.
		TSLiteral = { fg = mgz.col_blue }, -- Literal text.
		TSURI = { fg = mgz.col_teal }, -- Any URI like a link or email.
		TSAnnotation = { fg = mgz.col_red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
	}

	if vim.g.mgz_italic == false then
		-- Comments
		treesitter.TSComment = { fg = mgz.col_bluishgray }
		-- Conditionals
		treesitter.TSConditional = { fg = mgz.col_white } -- For keywords related to conditionnals.
		-- Function names
		treesitter.TSFunction = { fg = mgz.col_orange } -- For fuction (calls and definitions).
		treesitter.TSMethod = { fg = mgz.col_pink } -- For method calls and definitions.
		treesitter.TSFuncBuiltin = { fg = mgz.col_orange }
		-- Namespaces and property accessors
		treesitter.TSNamespace = { fg = mgz.col_blue } -- For identifiers referring to modules and namespaces.
		treesitter.TSField = { fg = mgz.col_blue } -- For fields in literals
		treesitter.TSProperty = { fg = mgz.col_lightblue } -- Same as `TSField`
		-- Language keywords
		treesitter.TSKeyword = { fg = mgz.col_darkblue } -- For keywords that don't fall in other categories.
		treesitter.TSKeywordFunction = { fg = mgz.col_orange }
		treesitter.TSKeywordReturn = { fg = mgz.col_orange }
		treesitter.TSKeywordOperator = { fg = mgz.col_orange }
		treesitter.TSRepeat = { fg = mgz.col_white } -- For keywords related to loops.
		-- Strings
		treesitter.TSString = { fg = mgz.col_teal } -- For strings.
		treesitter.TSStringRegex = { fg = mgz.col_pink } -- For regexes.
		treesitter.TSStringEscape = { fg = mgz.col_yellow } -- For escape characters within a string.
		treesitter.TSCharacter = { fg = mgz.col_teal } -- For characters.
	else
		-- Comments
		treesitter.TSComment = { fg = mgz.col_bluishgray, style = "italic" }
		-- Conditionals
		treesitter.TSConditional = { fg = mgz.col_white, style = "italic" } -- For keywords related to conditionnals.
		-- Function names
		treesitter.TSFunction = { fg = mgz.col_orange, style = "italic" } -- For fuction (calls and definitions).
		treesitter.TSMethod = { fg = mgz.col_pink, style = "italic" } -- For method calls and definitions.
		treesitter.TSFuncBuiltin = { fg = mgz.col_orange, style = "italic" }
		-- Namespaces and property accessors
		treesitter.TSNamespace = { fg = mgz.col_blue, style = "italic" } -- For identifiers referring to modules and namespaces.
		treesitter.TSField = { fg = mgz.col_blue, style = "italic" } -- For fields.
		treesitter.TSProperty = { fg = mgz.col_lightblue, style = "italic" } -- Same as `TSField`, but when accessing, not declaring.
		-- Language keywords
		treesitter.TSKeyword = { fg = mgz.col_white, style = "italic" } -- For keywords that don't fall in other categories.
		treesitter.TSKeywordFunction = { fg = mgz.col_orange, style = "italic" }
		treesitter.TSKeywordReturn = { fg = mgz.col_orange, style = "italic" }
		treesitter.TSKeywordOperator = { fg = mgz.col_orange, style = "italic" }
		treesitter.TSRepeat = { fg = mgz.col_white, style = "italic" } -- For keywords related to loops.
		-- Strings
		treesitter.TSString = { fg = mgz.col_teal, style = "italic" } -- For strings.
		treesitter.TSStringRegex = { fg = mgz.col_pink, style = "italic" } -- For regexes.
		treesitter.TSStringEscape = { fg = mgz.col_yellow, style = "italic" } -- For escape characters within a string.
		treesitter.TSCharacter = { fg = mgz.col_teal, style = "italic" } -- For characters.
	end

	return treesitter
end

theme.loadFiletypes = function()
	-- Filetype-specific highlight groups

	local ft = {
		-- yaml
		yamlBlockMappingKey = { fg = mgz.col_pink },
		yamlBool = { link = "Boolean" },
		yamlDocumentStart = { link = "Keyword" },
		yamlTSField = { fg = mgz.col_pink },
		yamlTSString = { fg = mgz.col_blue },
		yamlTSPunctSpecial = { link = "Keyword" },
		yamlKey = { fg = mgz.col_pink }, -- stephpy/vim-yaml
	}

	return ft
end

theme.loadLSP = function()
	-- Lsp highlight groups

	local lsp = {
		LspDiagnosticsDefaultError = { fg = mgz.col_red }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = mgz.col_red }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = mgz.col_red }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = mgz.col_red }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = mgz.col_red }, -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning = { fg = mgz.col_yellow }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = mgz.col_yellow }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = mgz.col_yellow }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = mgz.col_yellow }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = mgz.col_yellow }, -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation = { fg = mgz.col_lightblue }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = mgz.col_lightblue }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = mgz.col_lightblue }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = mgz.col_lightblue }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = mgz.col_lightblue }, -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint = { fg = mgz.col_white }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = mgz.col_white }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = mgz.col_white }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = mgz.col_white }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = mgz.col_lightblue }, -- used to underline "Hint" diagnostics.
		LspReferenceText = { fg = mgz.col_blue, bg = mgz.col_verydarkgray }, -- used for highlighting "text" references
		LspReferenceRead = { fg = mgz.col_blue, bg = mgz.col_verydarkgray }, -- used for highlighting "read" references
		LspReferenceWrite = { fg = mgz.col_blue, bg = mgz.col_verydarkgray }, -- used for highlighting "write" references

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

theme.loadPlugins = function()
	-- Plugins highlight groups

	local plugins = {

		-- LspTrouble
		LspTroubleText = { fg = mgz.col_blue },
		LspTroubleCount = { fg = mgz.col_white, bg = mgz.col_lightblue },
		LspTroubleNormal = { fg = mgz.col_blue, bg = mgz.sidebar },

		-- Diff
		diffAdded = { fg = mgz.col_teal },
		diffRemoved = { fg = mgz.col_red },
		diffChanged = { fg = mgz.col_yellow },
		diffOldFile = { fg = mgz.yelow },
		diffNewFile = { fg = mgz.col_stronggreen },
		diffFile = { fg = mgz.col_pink },
		diffLine = { fg = mgz.col_gray },
		diffIndexLine = { fg = mgz.col_white },

		-- Neogit
		NeogitBranch = { fg = mgz.col_lightblue },
		NeogitRemote = { fg = mgz.col_white },
		NeogitHunkHeader = { fg = mgz.col_orange },
		NeogitHunkHeaderHighlight = { fg = mgz.col_orange, bg = mgz.col_verydarkgray },
		NeogitDiffContextHighlight = { bg = mgz.col_verydarkgray },
		NeogitDiffDeleteHighlight = { fg = mgz.col_red, style = "reverse" },
		NeogitDiffAddHighlight = { fg = mgz.col_teal, style = "reverse" },

		-- GitGutter
		GitGutterAdd = { fg = mgz.col_teal }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = mgz.col_yellow }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = mgz.col_red }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd = { fg = mgz.col_teal }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr = { fg = mgz.col_teal }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn = { fg = mgz.col_teal }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = mgz.col_yellow }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr = { fg = mgz.col_yellow }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn = { fg = mgz.col_yellow }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = mgz.col_red }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr = { fg = mgz.col_red }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn = { fg = mgz.col_red }, -- diff mode: Deleted line |diff.txt|
		GitSignsCurrentLineBlame = { fg = mgz.col_bluishgray, style = "bold" },

		-- Telescope
		TelescopePromptBorder = { fg = mgz.col_orange },
		TelescopeResultsBorder = { fg = mgz.col_white },
		TelescopePreviewBorder = { fg = mgz.col_teal },
		TelescopeSelectionCaret = { fg = mgz.col_white },
		TelescopeSelection = { fg = mgz.col_white },
		TelescopeMatching = { fg = mgz.col_orange },

		-- NvimTree
		NvimTreeRootFolder = { fg = mgz.col_pink, style = "bold" },
		NvimTreeGitDirty = { fg = mgz.col_yellow },
		NvimTreeGitNew = { fg = mgz.col_teal },
		NvimTreeImageFile = { fg = mgz.col_yellow },
		NvimTreeExecFile = { fg = mgz.col_teal },
		NvimTreeSpecialFile = { fg = mgz.col_white, style = "underline" },
		NvimTreeFolderName = { fg = mgz.col_lightblue },
		NvimTreeEmptyFolderName = { fg = mgz.col_verydarkgray },
		NvimTreeFolderIcon = { fg = mgz.col_blue },
		NvimTreeIndentMarker = { fg = mgz.col_verydarkgray },
		LspDiagnosticsError = { fg = mgz.col_red },
		LspDiagnosticsWarning = { fg = mgz.col_yellow },
		LspDiagnosticsInformation = { fg = mgz.col_lightblue },
		LspDiagnosticsHint = { fg = mgz.col_white },

		-- WhichKey
		WhichKey = { fg = mgz.col_blue, style = "bold" },
		WhichKeyGroup = { fg = mgz.col_blue },
		WhichKeyDesc = { fg = mgz.col_pink, style = "italic" },
		WhichKeySeperator = { fg = mgz.col_blue },
		WhichKeyFloating = { bg = mgz.float },
		WhichKeyFloat = { bg = mgz.float },

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
		SneakScope = { bg = mgz.col_verydarkgray },

		-- Cmp
		CmpItemKind = { fg = mgz.col_yellow },
		CmpItemAbbrMatch = { fg = mgz.col_termcursor, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = mgz.col_termcursor, style = "bold" },
		CmpItemAbbr = { fg = mgz.col_blue },
		CmpItemMenu = { fg = mgz.col_teal },

		-- Indent Blankline
		IndentBlanklineChar = { fg = mgz.col_gray },
		IndentBlanklineContextChar = { fg = mgz.col_lightblue },

		-- Illuminate
		illuminatedWord = { bg = mgz.col_gray },
		illuminatedCurWord = { bg = mgz.col_gray },

		-- nvim-dap
		DapBreakpoint = { fg = mgz.col_teal },
		DapStopped = { fg = mgz.col_yellow },

		-- nvim-dap-ui
		DapUIVariable = { fg = mgz.col_blue },
		DapUIScope = { fg = mgz.col_orange },
		DapUIType = { fg = mgz.col_white },
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

		-- Hop
		HopNextKey = { fg = mgz.col_blue, style = "bold" },
		HopNextKey1 = { fg = mgz.col_orange, style = "bold" },
		HopNextKey2 = { fg = mgz.col_blue },
		HopUnmatched = { fg = mgz.col_gray },

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
		LightspeedUnlabeledMatch = { fg = mgz.col_blue, bg = mgz.col_verydarkgray },
		LightspeedOneCharMatch = { fg = mgz.col_orange, style = "bold,reverse" },
		LightspeedUniqueChar = { style = "bold,underline" },

		-- copilot
		CopilotLabel = { fg = mgz.col_gray, bg = mgz.none },

		-- Statusline
		StatusLineDull = { fg = mgz.col_gray, bg = mgz.col_verydarkgray },
		StatusLineAccent = { fg = mgz.col_black, bg = mgz.col_purple },

		-- mini.nvim
		MiniCompletionActiveParameter = { style = "underline" },

		MiniCursorword = { bg = mgz.col_gray },
		MiniCursorwordCurrent = { bg = mgz.col_gray },

		MiniIndentscopeSymbol = { fg = mgz.col_lightblue },
		MiniIndentscopePrefix = { style = "nocombine" }, -- Make it invisible

		MiniJump = { fg = mgz.col_black, bg = mgz.col_blue },

		MiniJump2dSpot = { fg = mgz.col_stronggreen, style = "bold,nocombine" },

		MiniStarterCurrent = { style = "nocombine" },
		MiniStarterFooter = { fg = mgz.col_teal, style = "italic" },
		MiniStarterHeader = { fg = mgz.col_white },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { fg = mgz.col_blue },
		MiniStarterItemPrefix = { fg = mgz.col_yellow },
		MiniStarterSection = { fg = mgz.col_blue },
		MiniStarterQuery = { fg = mgz.col_lightblue },

		MiniStatuslineDevinfo = { fg = mgz.col_blue, bg = mgz.col_darkgray },
		MiniStatuslineFileinfo = { fg = mgz.col_blue, bg = mgz.col_darkgray },
		MiniStatuslineFilename = { fg = mgz.col_blue, bg = mgz.col_verydarkgray },
		MiniStatuslineInactive = { fg = mgz.col_blue, bg = mgz.col_black, style = "bold" },
		MiniStatuslineModeCommand = { fg = mgz.col_black, bg = mgz.col_yellow, style = "bold" },
		MiniStatuslineModeInsert = { fg = mgz.col_verydarkgray, bg = mgz.col_blue, style = "bold" },
		MiniStatuslineModeNormal = { fg = mgz.col_verydarkgray, bg = mgz.col_white, style = "bold" },
		MiniStatuslineModeOther = { fg = mgz.col_black, bg = mgz.col_purple, style = "bold" },
		MiniStatuslineModeReplace = { fg = mgz.col_black, bg = mgz.col_red, style = "bold" },
		MiniStatuslineModeVisual = { fg = mgz.col_black, bg = mgz.col_pink, style = "bold" },

		MiniSurround = { link = "IncSearch" },

		MiniTablineCurrent = { bg = mgz.col_verydarkgray },
		MiniTablineFill = { link = "TabLineFill" },
		MiniTablineHidden = { bg = mgz.col_black, fg = mgz.col_gray },
		MiniTablineModifiedCurrent = { bg = mgz.col_verydarkgray, fg = mgz.col_yellow },
		MiniTablineModifiedHidden = { bg = mgz.col_black, fg = mgz.col_yellow },
		MiniTablineModifiedVisible = { bg = mgz.col_darkgray, fg = mgz.col_yellow },
		MiniTablineTabpagesection = { fg = mgz.col_lightblue, bg = mgz.col_huh, style = "reverse,bold" },
		MiniTablineVisible = { bg = mgz.col_darkgray },

		MiniTestEmphasis = { style = "bold" },
		MiniTestFail = { fg = mgz.col_red, style = "bold" },
		MiniTestPass = { fg = mgz.col_teal, style = "bold" },

		MiniTrailspace = { bg = mgz.col_red },


        -- Aerail
        AerialLine = {bg = mgz.col_darkgray},
        AerialLineNC = {bg = mgz.col_darkgray},
        
        AerialArrayIcon = { fg = mgz.col_purple },
        AerialBooleanIcon = { fg = mgz.col_liminal },
        AerialClassIcon = { fg = mgz.col_white },
        AerialConstansIcon = { fg = mgz.col_purple },
        AerialConstructorIcon = { fg = mgz.col_white },
        AerialEnumIcon = { fg = mgz.col_white },
        AerialEnumMemberIcon = { fg = mgz.col_blue },
        AerialEventIcon = { fg = mgz.col_white },
        AerialFieldIcon = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic"} or {fg = mgz.col_blue },
        AerialFileIcon = { fg = mgz.col_teal },
        AerialFunctionIcon = vim.g.mgz_italic and { fg = mgz.col_orange, style = "italic" } or { fg = mgz.col_orange },
        AerialInterfaceIcon = { fg = mgz.col_white },
        AerialKeyIcon = { fg = mgz.col_white },
        AerialMethodIcon = vim.g.mgz_italic and  { fg = mgz.col_pink, style = "italic" } or {fg = mgz.col_pink },
        AerialModuleIcon = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic" } or { fg = mgz.col_blue },
        AerialNamespaceIcon = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic" } or { fg = mgz.col_blue },
        AerialNullIcon = { fg = mgz.col_white },
        AerialNumberIcon = { fg = mgz.col_yellow },
        AerialObjectIcon = { fg = mgz.col_white },
        AerialOperatorIcon = { fg = mgz.col_white },
        AerialPackageIcon = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic" } or { fg = mgz.col_blue },
        AerialPropertyIcon = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic" } or { fg = mgz.col_lightblue },
        AerialStringIcon = vim.g.mgz_italic and { fg = mgz.col_teal, style = "italic" } or { fg = mgz.col_teal },
        AerialStructIcon = { fg = mgz.col_white },
        AerialTypeParameterIcon = { fg = mgz.col_lightblue },
        AerialVariableIcon = {fg = mgz.col_blue, style = "bold"},

        AerialArray = { fg = mgz.col_purple },
        AerialBoolean = { fg = mgz.col_liminal },
        AerialClass = { fg = mgz.col_white },
        AerialConstans = { fg = mgz.col_purple },
        AerialConstructor = { fg = mgz.col_white },
        AerialEnum = { fg = mgz.col_white },
        AerialEnumMember = { fg = mgz.col_blue },
        AerialEvent = { fg = mgz.col_white },
        AerialField = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic"} or {fg = mgz.col_blue },
        AerialFile = { fg = mgz.col_teal },
        AerialFunction = vim.g.mgz_italic and { fg = mgz.col_orange, style = "italic" } or { fg = mgz.col_orange },
        AerialInterface = { fg = mgz.col_white },
        AerialKey = { fg = mgz.col_white },
        AerialMethod = vim.g.mgz_italic and  { fg = mgz.col_pink, style = "italic" } or {fg = mgz.col_pink },
        AerialModule = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic" } or { fg = mgz.col_blue },
        AerialNamespace = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic" } or { fg = mgz.col_blue },
        AerialNull = { fg = mgz.col_white },
        AerialNumber = { fg = mgz.col_yellow },
        AerialObject = { fg = mgz.col_white },
        AerialOperator = { fg = mgz.col_white },
        AerialPackage = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic" } or { fg = mgz.col_blue },
        AerialProperty = vim.g.mgz_italic and  { fg = mgz.col_blue, style = "italic" } or { fg = mgz.col_lightblue },
        AerialString = vim.g.mgz_italic and { fg = mgz.col_teal, style = "italic" } or { fg = mgz.col_teal },
        AerialStruct = { fg = mgz.col_white },
        AerialTypeParameter = { fg = mgz.col_lightblue },
        AerialVariable = {fg = mgz.col_blue, style = "bold"},
	}
	-- Options:

	-- Disable nvim-tree background
	if vim.g.mgz_disable_background then
		plugins.NvimTreeNormal = { fg = mgz.col_blue, bg = mgz.none }
	else
		plugins.NvimTreeNormal = { fg = mgz.col_blue, bg = mgz.sidebar }
	end

	if vim.g.mgz_enable_sidebar_background then
		plugins.NvimTreeNormal = { fg = mgz.col_blue, bg = mgz.sidebar }
	else
		plugins.NvimTreeNormal = { fg = mgz.col_blue, bg = mgz.none }
	end

	return plugins
end

return theme
