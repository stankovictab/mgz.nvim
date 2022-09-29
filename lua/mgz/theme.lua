-- The third file

local mgz = require("mgz.colors")

local theme = {}

theme.loadSyntax = function()
	-- Syntax highlight groups
	local syntax = {
		Type = { fg = mgz.mgz9_gui }, -- int, long, char, etc.
		StorageClass = { fg = mgz.mgz9_gui }, -- static, register, volatile, etc.
		Structure = { fg = mgz.mgz9_gui }, -- struct, union, enum, etc.
		Constant = { fg = mgz.mgz4_gui }, -- any constant
		Character = { fg = mgz.mgz14_gui }, -- any character constant: 'c', '\n'
		Number = { fg = mgz.mgz15_gui }, -- a number constant: 5
		Boolean = { fg = mgz.mgz9_gui }, -- a boolean constant: TRUE, false
		Float = { fg = mgz.mgz15_gui }, -- a floating point constant: 2.3e10
		Statement = { fg = mgz.mgz9_gui }, -- any statement
		Label = { fg = mgz.mgz9_gui }, -- case, default, etc.
		Operator = { fg = mgz.mgz9_gui }, -- sizeof", "+", "*", etc.
		Exception = { fg = mgz.mgz9_gui }, -- try, catch, throw
		PreProc = { fg = mgz.mgz9_gui }, -- generic Preprocessor
		Include = { fg = mgz.mgz9_gui }, -- preprocessor #include
		Define = { fg = mgz.mgz9_gui }, -- preprocessor #define
		Macro = { fg = mgz.mgz9_gui }, -- same as Define
		Typedef = { fg = mgz.mgz9_gui }, -- A typedef
		PreCondit = { fg = mgz.mgz13_gui }, -- preprocessor #if, #else, #endif, etc.
		Special = { fg = mgz.mgz4_gui }, -- any special symbol
		SpecialChar = { fg = mgz.mgz13_gui }, -- special character in a constant
		Tag = { fg = mgz.mgz4_gui }, -- you can use CTRL-] on this
		Delimiter = { fg = mgz.mgz6_gui }, -- character that needs attention like , or .
		SpecialComment = { fg = mgz.mgz8_gui }, -- special things inside a comment
		Debug = { fg = mgz.mgz11_gui }, -- debugging statements
		Underlined = { fg = mgz.mgz14_gui, bg = mgz.none, style = "underline" }, -- text that stands out, HTML links
		Ignore = { fg = mgz.mgz1_gui }, -- left blank, hidden
		Error = { fg = mgz.mgz11_gui, bg = mgz.none, style = "bold,underline" }, -- any erroneous construct
		Todo = { fg = mgz.mgz13_gui, bg = mgz.none, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Conceal = { fg = mgz.none, bg = mgz.mgz0_gui },

		htmlLink = { fg = mgz.mgz14_gui, style = "underline" },
		htmlH1 = { fg = mgz.mgz8_gui, style = "bold" },
		htmlH2 = { fg = mgz.mgz11_gui, style = "bold" },
		htmlH3 = { fg = mgz.mgz14_gui, style = "bold" },
		htmlH4 = { fg = mgz.mgz15_gui, style = "bold" },
		htmlH5 = { fg = mgz.mgz9_gui, style = "bold" },
		markdownH1 = { fg = mgz.mgz8_gui, style = "bold" },
		markdownH2 = { fg = mgz.mgz11_gui, style = "bold" },
		markdownH3 = { fg = mgz.mgz14_gui, style = "bold" },
		markdownH1Delimiter = { fg = mgz.mgz8_gui },
		markdownH2Delimiter = { fg = mgz.mgz11_gui },
		markdownH3Delimiter = { fg = mgz.mgz14_gui },
	}

	-- Italic comments
	if vim.g.mgz_italic == false then
		syntax.Comment = { fg = mgz.mgz3_gui_bright } -- normal comments
		syntax.Conditional = { fg = mgz.mgz9_gui } -- normal if, then, else, endif, switch, etc.
		syntax.Function = { fg = mgz.mgz8_gui } -- normal function names
		syntax.Identifier = { fg = mgz.mgz9_gui } -- any variable name
		syntax.Keyword = { fg = mgz.mgz9_gui } -- normal for, do, while, etc.
		syntax.Repeat = { fg = mgz.mgz9_gui } -- normal any other keyword
		syntax.String = { fg = mgz.mgz14_gui } -- any string
	else
		syntax.Comment = { fg = mgz.mgz3_gui_bright, bg = mgz.none, style = "italic" } -- italic comments
		syntax.Conditional = { fg = mgz.mgz9_gui, bg = mgz.none, style = "italic" } -- italic if, then, else, endif, switch, etc.
		syntax.Function = { fg = mgz.mgz8_gui, bg = mgz.none, style = "italic" } -- italic funtion names
		syntax.Identifier = { fg = mgz.mgz9_gui, bg = mgz.none, style = "italic" } -- any variable name
		syntax.Keyword = { fg = mgz.mgz9_gui, bg = mgz.none, style = "italic" } -- italic for, do, while, etc.
		syntax.Repeat = { fg = mgz.mgz9_gui, bg = mgz.none, style = "italic" } -- italic any other keyword
		syntax.String = { fg = mgz.mgz14_gui, bg = mgz.none, style = "italic" } -- any string
	end

	return syntax
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {
		NormalFloat = { fg = mgz.mgz4_gui, bg = mgz.float }, -- normal text and background color
		FloatBorder = { fg = mgz.mgz4_gui, bg = mgz.float }, -- normal text and background color
		ColorColumn = { fg = mgz.none, bg = mgz.mgz1_gui }, --  used for the columns set with 'colorcolumn'
		Conceal = { fg = mgz.mgz1_gui }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = mgz.mgz4_gui, bg = mgz.none, style = "reverse" }, -- the character under the cursor
		CursorIM = { fg = mgz.mgz5_gui, bg = mgz.none, style = "reverse" }, -- like Cursor, but used when in IME mode
		Directory = { fg = mgz.mgz7_gui, bg = mgz.none }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = mgz.mgz1_gui },
		ErrorMsg = { fg = mgz.none },
		Folded = { fg = mgz.mgz3_gui_bright, bg = mgz.none, style = "italic" },
		FoldColumn = { fg = mgz.mgz7_gui },
		IncSearch = { fg = mgz.mgz6_gui, bg = mgz.mgz10_gui },
		LineNr = { fg = mgz.mgz3_gui_bright },
		CursorLineNr = { fg = mgz.mgz4_gui },
		MatchParen = { fg = mgz.mgz15_gui, bg = mgz.none, style = "bold" },
		ModeMsg = { fg = mgz.mgz4_gui },
		MoreMsg = { fg = mgz.mgz4_gui },
		NonText = { fg = mgz.mgz1_gui },
		Pmenu = { fg = mgz.mgz4_gui, bg = mgz.mgz2_gui },
		PmenuSel = { fg = mgz.mgz4_gui, bg = mgz.mgz10_gui },
		PmenuSbar = { fg = mgz.mgz4_gui, bg = mgz.mgz2_gui },
		PmenuThumb = { fg = mgz.mgz4_gui, bg = mgz.mgz4_gui },
		Question = { fg = mgz.mgz14_gui },
		QuickFixLine = { fg = mgz.mgz4_gui, bg = mgz.none, style = "reverse" },
		qfLineNr = { fg = mgz.mgz4_gui, bg = mgz.none, style = "reverse" },
		Search = { fg = mgz.mgz10_gui, bg = mgz.mgz6_gui, style = "reverse" },
		SpecialKey = { fg = mgz.mgz9_gui },
		SpellBad = { fg = mgz.mgz11_gui, bg = mgz.none, style = "italic,undercurl" },
		SpellCap = { fg = mgz.mgz7_gui, bg = mgz.none, style = "italic,undercurl" },
		SpellLocal = { fg = mgz.mgz8_gui, bg = mgz.none, style = "italic,undercurl" },
		SpellRare = { fg = mgz.mgz9_gui, bg = mgz.none, style = "italic,undercurl" },
		StatusLine = { fg = mgz.mgz4_gui, bg = mgz.mgz2_gui },
		StatusLineNC = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui },
		StatusLineTerm = { fg = mgz.mgz4_gui, bg = mgz.mgz2_gui },
		StatusLineTermNC = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui },
		TabLineFill = { fg = mgz.mgz4_gui, bg = mgz.none },
		TablineSel = { fg = mgz.mgz1_gui, bg = mgz.mgz9_gui },
		Tabline = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui },
		Title = { fg = mgz.mgz14_gui, bg = mgz.none, style = "bold" },
		Visual = { fg = mgz.none, bg = mgz.mgz2_gui },
		VisualNOS = { fg = mgz.none, bg = mgz.mgz2_gui },
		WarningMsg = { fg = mgz.mgz15_gui },
		WildMenu = { fg = mgz.mgz12_gui, bg = mgz.none, style = "bold" },
		CursorColumn = { fg = mgz.none, bg = mgz.cursorlinefg },
		CursorLine = { fg = mgz.none, bg = mgz.cursorlinefg },
		ToolbarLine = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui },
		ToolbarButton = { fg = mgz.mgz4_gui, bg = mgz.none, style = "bold" },
		NormalMode = { fg = mgz.mgz4_gui, bg = mgz.none, style = "reverse" },
		InsertMode = { fg = mgz.mgz14_gui, bg = mgz.none, style = "reverse" },
		ReplacelMode = { fg = mgz.mgz11_gui, bg = mgz.none, style = "reverse" },
		VisualMode = { fg = mgz.mgz9_gui, bg = mgz.none, style = "reverse" },
		CommandMode = { fg = mgz.mgz4_gui, bg = mgz.none, style = "reverse" },
		Warnings = { fg = mgz.mgz15_gui },

		healthError = { fg = mgz.mgz11_gui },
		healthSuccess = { fg = mgz.mgz14_gui },
		healthWarning = { fg = mgz.mgz15_gui },

		-- dashboard
		DashboardShortCut = { fg = mgz.mgz7_gui },
		DashboardHeader = { fg = mgz.mgz9_gui },
		DashboardCenter = { fg = mgz.mgz8_gui },
		DashboardFooter = { fg = mgz.mgz14_gui, style = "italic" },

		-- Barbar
		BufferTabpageFill = { bg = mgz.mgz0_gui },

		BufferCurrent = { bg = mgz.mgz1_gui },
		BufferCurrentMod = { bg = mgz.mgz1_gui, fg = mgz.mgz15_gui },
		BufferCurrentIcon = { bg = mgz.mgz1_gui },
		BufferCurrentSign = { bg = mgz.mgz1_gui },
		BufferCurrentIndex = { bg = mgz.mgz1_gui },
		BufferCurrentTarget = { bg = mgz.mgz1_gui, fg = mgz.mgz11_gui },

		BufferInactive = { bg = mgz.mgz0_gui, fg = mgz.mgz3_gui },
		BufferInactiveMod = { bg = mgz.mgz0_gui, fg = mgz.mgz15_gui },
		BufferInactiveIcon = { bg = mgz.mgz0_gui , fg = mgz.mgz3_gui },
		BufferInactiveSign = { bg = mgz.mgz0_gui , fg = mgz.mgz3_gui },
		BufferInactiveIndex = { bg = mgz.mgz0_gui , fg = mgz.mgz3_gui },
		BufferInactiveTarget = { bg = mgz.mgz0_gui, fg = mgz.mgz11_gui },

		BufferVisible = { bg = mgz.mgz2_gui },
		BufferVisibleMod = { bg = mgz.mgz2_gui, fg = mgz.mgz15_gui },
		BufferVisibleIcon = { bg = mgz.mgz2_gui },
		BufferVisibleSign = { bg = mgz.mgz2_gui },
		BufferVisibleIndex = { bg = mgz.mgz2_gui },
		BufferVisibleTarget = { bg = mgz.mgz2_gui, fg = mgz.mgz11_gui },

		-- nvim-notify
		NotifyDEBUGBorder = { fg = mgz.mgz3_gui },
		NotifyDEBUGIcon = { fg = mgz.mgz3_gui },
		NotifyDEBUGTitle = { fg = mgz.mgz3_gui },
		NotifyERRORBorder = { fg = mgz.mgz11_gui },
		NotifyERRORIcon = { fg = mgz.mgz11_gui },
		NotifyERRORTitle = { fg = mgz.mgz11_gui },
		NotifyINFOBorder = { fg = mgz.mgz14_gui },
		NotifyINFOIcon = { fg = mgz.mgz14_gui },
		NotifyINFOTitle = { fg = mgz.mgz14_gui },
		NotifyTRACEBorder = { fg = mgz.mgz15_gui },
		NotifyTRACEIcon = { fg = mgz.mgz15_gui },
		NotifyTRACETitle = { fg = mgz.mgz15_gui },
		NotifyWARNBorder = { fg = mgz.mgz13_gui },
		NotifyWARNIcon = { fg = mgz.mgz13_gui },
		NotifyWARNTitle = { fg = mgz.mgz13_gui },

		-- leap.nvim
		LeapMatch = { style="underline,nocombine", fg=mgz.mgz13_gui },
		LeapLabelPrimary = { style="nocombine", fg=mgz.mgz0_gui, bg=mgz.mgz13_gui },
		LeapLabelSecondary = { style="nocombine", fg=mgz.mgz0_gui, bg=mgz.mgz15_gui },
	}

	-- Options:

	--Set transparent background
	if vim.g.mgz_disable_background then
		editor.Normal = { fg = mgz.mgz4_gui, bg = mgz.none } -- normal text and background color
		editor.SignColumn = { fg = mgz.mgz4_gui, bg = mgz.none }
	else
		editor.Normal = { fg = mgz.mgz4_gui, bg = mgz.mgz0_gui } -- normal text and background color
		editor.SignColumn = { fg = mgz.mgz4_gui, bg = mgz.mgz0_gui }
	end

	-- Remove window split borders
	if vim.g.mgz_borders then
		editor.VertSplit = { fg = mgz.mgz2_gui }
	else
		editor.VertSplit = { fg = mgz.mgz0_gui }
	end

	if vim.g.mgz_uniform_diff_background then
		editor.DiffAdd = { fg = mgz.mgz14_gui, bg = mgz.mgz1_gui } -- diff mode: Added line
		editor.DiffChange = { fg = mgz.mgz13_gui, bg = mgz.mgz1_gui } --  diff mode: Changed line
		editor.DiffDelete = { fg = mgz.mgz11_gui, bg = mgz.mgz1_gui } -- diff mode: Deleted line
		editor.DiffText = { fg = mgz.mgz15_gui, bg = mgz.mgz1_gui } -- diff mode: Changed text within a changed line
	else
		editor.DiffAdd = { fg = mgz.mgz14_gui, bg = mgz.none, style = "reverse" } -- diff mode: Added line
		editor.DiffChange = { fg = mgz.mgz13_gui, bg = mgz.none, style = "reverse" } --  diff mode: Changed line
		editor.DiffDelete = { fg = mgz.mgz11_gui, bg = mgz.none, style = "reverse" } -- diff mode: Deleted line
		editor.DiffText = { fg = mgz.mgz15_gui, bg = mgz.none, style = "reverse" } -- diff mode: Changed text within a changed line
	end

	return editor
end

theme.loadTerminal = function()
	vim.g.terminal_color_0 = mgz.mgz1_gui
	vim.g.terminal_color_1 = mgz.mgz11_gui
	vim.g.terminal_color_2 = mgz.mgz14_gui
	vim.g.terminal_color_3 = mgz.mgz13_gui
	vim.g.terminal_color_4 = mgz.mgz9_gui
	vim.g.terminal_color_5 = mgz.mgz15_gui
	vim.g.terminal_color_6 = mgz.mgz8_gui
	vim.g.terminal_color_7 = mgz.mgz5_gui
	vim.g.terminal_color_8 = mgz.mgz3_gui
	vim.g.terminal_color_9 = mgz.mgz11_gui
	vim.g.terminal_color_10 = mgz.mgz14_gui
	vim.g.terminal_color_11 = mgz.mgz13_gui
	vim.g.terminal_color_12 = mgz.mgz9_gui
	vim.g.terminal_color_13 = mgz.mgz15_gui
	vim.g.terminal_color_14 = mgz.mgz7_gui
	vim.g.terminal_color_15 = mgz.mgz6_gui
end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		TSAnnotation = { fg = mgz.mgz12_gui }, -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
		TSConstructor = { fg = mgz.mgz9_gui }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		TSConstant = { fg = mgz.mgz13_gui }, -- For constants
		TSFloat = { fg = mgz.mgz15_gui }, -- For floats
		TSNumber = { fg = mgz.mgz15_gui }, -- For all number

		TSAttribute = { fg = mgz.mgz15_gui }, -- (unstable) TODO: docs
		TSVariable = { fg = mgz.mgz4_gui, style = "bold" }, -- Any variable name that does not have another highlight.
		TSVariableBuiltin = { fg = mgz.mgz4_gui, style = "bold" },
		TSBoolean = { fg = mgz.mgz9_gui, style = "bold" }, -- For booleans.
		TSConstBuiltin = { fg = mgz.mgz7_gui, style = "bold" }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro = { fg = mgz.mgz7_gui, style = "bold" }, -- For constants that are defined by macros: `NULL` in C.
		TSError = { fg = mgz.mgz11_gui }, -- For syntax/parser errors.
		TSException = { fg = mgz.mgz15_gui }, -- For exception related keywords.
		TSFuncMacro = { fg = mgz.mgz7_gui }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = mgz.mgz9_gui }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSLabel = { fg = mgz.mgz15_gui }, -- For labels: `label:` in C and `:label:` in Lua.
		TSOperator = { fg = mgz.mgz9_gui }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = mgz.mgz10_gui }, -- For parameters of a function.
		TSParameterReference = { fg = mgz.mgz10_gui }, -- For references to parameters of a function.
		TSPunctDelimiter = { fg = mgz.mgz8_gui }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = mgz.mgz8_gui }, -- For brackets and parens.
		TSPunctSpecial = { fg = mgz.mgz8_gui }, -- For special punctutation that does not fall in the catagories before.
		TSSymbol = { fg = mgz.mgz15_gui }, -- For identifiers referring to symbols or atoms.
		TSType = { fg = mgz.mgz9_gui }, -- For types.
		TSTypeBuiltin = { fg = mgz.mgz9_gui }, -- For builtin types.
		TSTag = { fg = mgz.mgz4_gui }, -- Tags like html tag names.
		TSTagDelimiter = { fg = mgz.mgz15_gui }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = mgz.mgz4_gui }, -- For strings considemgz11_gui text in a markup language.
		TSTextReference = { fg = mgz.mgz15_gui }, -- FIXME
		TSEmphasis = { fg = mgz.mgz10_gui }, -- For text to be represented with emphasis.
		TSUnderline = { fg = mgz.mgz4_gui, bg = mgz.none, style = "underline" }, -- For text to be represented with an underline.
		TSTitle = { fg = mgz.mgz10_gui, bg = mgz.none, style = "bold" }, -- Text that is part of a title.
		TSLiteral = { fg = mgz.mgz4_gui }, -- Literal text.
		TSURI = { fg = mgz.mgz14_gui }, -- Any URI like a link or email.
		TSAnnotation = { fg = mgz.mgz11_gui }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
	}

	if vim.g.mgz_italic == false then
		-- Comments
		treesitter.TSComment = { fg = mgz.mgz3_gui_bright }
		-- Conditionals
		treesitter.TSConditional = { fg = mgz.mgz9_gui } -- For keywords related to conditionnals.
		-- Function names
		treesitter.TSFunction = { fg = mgz.mgz8_gui } -- For fuction (calls and definitions).
		treesitter.TSMethod = { fg = mgz.mgz7_gui } -- For method calls and definitions.
		treesitter.TSFuncBuiltin = { fg = mgz.mgz8_gui }
		-- Namespaces and property accessors
		treesitter.TSNamespace = { fg = mgz.mgz4_gui } -- For identifiers referring to modules and namespaces.
		treesitter.TSField = { fg = mgz.mgz4_gui } -- For fields in literals
		treesitter.TSProperty = { fg = mgz.mgz10_gui } -- Same as `TSField`
		-- Language keywords
		treesitter.TSKeyword = { fg = mgz.mgz9_gui } -- For keywords that don't fall in other categories.
		treesitter.TSKeywordFunction = { fg = mgz.mgz8_gui }
		treesitter.TSKeywordReturn = { fg = mgz.mgz8_gui }
		treesitter.TSKeywordOperator = { fg = mgz.mgz8_gui }
		treesitter.TSRepeat = { fg = mgz.mgz9_gui } -- For keywords related to loops.
		-- Strings
		treesitter.TSString = { fg = mgz.mgz14_gui } -- For strings.
		treesitter.TSStringRegex = { fg = mgz.mgz7_gui } -- For regexes.
		treesitter.TSStringEscape = { fg = mgz.mgz15_gui } -- For escape characters within a string.
		treesitter.TSCharacter = { fg = mgz.mgz14_gui } -- For characters.
	else
		-- Comments
		treesitter.TSComment = { fg = mgz.mgz3_gui_bright, style = "italic" }
		-- Conditionals
		treesitter.TSConditional = { fg = mgz.mgz9_gui, style = "italic" } -- For keywords related to conditionnals.
		-- Function names
		treesitter.TSFunction = { fg = mgz.mgz8_gui, style = "italic" } -- For fuction (calls and definitions).
		treesitter.TSMethod = { fg = mgz.mgz7_gui, style = "italic" } -- For method calls and definitions.
		treesitter.TSFuncBuiltin = { fg = mgz.mgz8_gui, style = "italic" }
		-- Namespaces and property accessors
		treesitter.TSNamespace = { fg = mgz.mgz4_gui, style = "italic" } -- For identifiers referring to modules and namespaces.
		treesitter.TSField = { fg = mgz.mgz4_gui, style = "italic" } -- For fields.
		treesitter.TSProperty = { fg = mgz.mgz10_gui, style = "italic" } -- Same as `TSField`, but when accessing, not declaring.
		-- Language keywords
		treesitter.TSKeyword = { fg = mgz.mgz9_gui, style = "italic" } -- For keywords that don't fall in other categories.
		treesitter.TSKeywordFunction = { fg = mgz.mgz8_gui, style = "italic" }
		treesitter.TSKeywordReturn = { fg = mgz.mgz8_gui, style = "italic" }
		treesitter.TSKeywordOperator = { fg = mgz.mgz8_gui, style = "italic" }
		treesitter.TSRepeat = { fg = mgz.mgz9_gui, style = "italic" } -- For keywords related to loops.
		-- Strings
		treesitter.TSString = { fg = mgz.mgz14_gui, style = "italic" } -- For strings.
		treesitter.TSStringRegex = { fg = mgz.mgz7_gui, style = "italic" } -- For regexes.
		treesitter.TSStringEscape = { fg = mgz.mgz15_gui, style = "italic" } -- For escape characters within a string.
		treesitter.TSCharacter = { fg = mgz.mgz14_gui, style = "italic" } -- For characters.
	end

	return treesitter
end

theme.loadFiletypes = function()
	-- Filetype-specific highlight groups

	local ft = {
		-- yaml
		yamlBlockMappingKey = { fg = mgz.mgz7_gui },
		yamlBool = { link = "Boolean" },
		yamlDocumentStart = { link = "Keyword" },
		yamlTSField = { fg = mgz.mgz7_gui },
		yamlTSString = { fg = mgz.mgz4_gui },
		yamlTSPunctSpecial = { link = "Keyword" },
		yamlKey = { fg = mgz.mgz7_gui }, -- stephpy/vim-yaml
	}

	return ft
end

theme.loadLSP = function()
	-- Lsp highlight groups

	local lsp = {
		LspDiagnosticsDefaultError = { fg = mgz.mgz11_gui }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = mgz.mgz11_gui }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = mgz.mgz11_gui }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = mgz.mgz11_gui }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = mgz.mgz11_gui }, -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning = { fg = mgz.mgz15_gui }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = mgz.mgz15_gui }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = mgz.mgz15_gui }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = mgz.mgz15_gui }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = mgz.mgz15_gui }, -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation = { fg = mgz.mgz10_gui }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = mgz.mgz10_gui }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = mgz.mgz10_gui }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = mgz.mgz10_gui }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = mgz.mgz10_gui }, -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint = { fg = mgz.mgz9_gui }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = mgz.mgz9_gui }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = mgz.mgz9_gui }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = mgz.mgz9_gui }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = mgz.mgz10_gui }, -- used to underline "Hint" diagnostics.
		LspReferenceText = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui }, -- used for highlighting "text" references
		LspReferenceRead = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui }, -- used for highlighting "read" references
		LspReferenceWrite = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui }, -- used for highlighting "write" references

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
		LspTroubleText = { fg = mgz.mgz4_gui },
		LspTroubleCount = { fg = mgz.mgz9_gui, bg = mgz.mgz10_gui },
		LspTroubleNormal = { fg = mgz.mgz4_gui, bg = mgz.sidebar },

		-- Diff
		diffAdded = { fg = mgz.mgz14_gui },
		diffRemoved = { fg = mgz.mgz11_gui },
		diffChanged = { fg = mgz.mgz15_gui },
		diffOldFile = { fg = mgz.yelow },
		diffNewFile = { fg = mgz.mgz12_gui },
		diffFile = { fg = mgz.mgz7_gui },
		diffLine = { fg = mgz.mgz3_gui },
		diffIndexLine = { fg = mgz.mgz9_gui },

		-- Neogit
		NeogitBranch = { fg = mgz.mgz10_gui },
		NeogitRemote = { fg = mgz.mgz9_gui },
		NeogitHunkHeader = { fg = mgz.mgz8_gui },
		NeogitHunkHeaderHighlight = { fg = mgz.mgz8_gui, bg = mgz.mgz1_gui },
		NeogitDiffContextHighlight = { bg = mgz.mgz1_gui },
		NeogitDiffDeleteHighlight = { fg = mgz.mgz11_gui, style = "reverse" },
		NeogitDiffAddHighlight = { fg = mgz.mgz14_gui, style = "reverse" },

		-- GitGutter
		GitGutterAdd = { fg = mgz.mgz14_gui }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = mgz.mgz15_gui }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = mgz.mgz11_gui }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd = { fg = mgz.mgz14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr = { fg = mgz.mgz14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn = { fg = mgz.mgz14_gui }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = mgz.mgz15_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr = { fg = mgz.mgz15_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn = { fg = mgz.mgz15_gui }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = mgz.mgz11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr = { fg = mgz.mgz11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn = { fg = mgz.mgz11_gui }, -- diff mode: Deleted line |diff.txt|
		GitSignsCurrentLineBlame = { fg = mgz.mgz3_gui_bright, style = "bold" },

		-- Telescope
		TelescopePromptBorder = { fg = mgz.mgz8_gui },
		TelescopeResultsBorder = { fg = mgz.mgz9_gui },
		TelescopePreviewBorder = { fg = mgz.mgz14_gui },
		TelescopeSelectionCaret = { fg = mgz.mgz9_gui },
		TelescopeSelection = { fg = mgz.mgz9_gui },
		TelescopeMatching = { fg = mgz.mgz8_gui },

		-- NvimTree
		NvimTreeRootFolder = { fg = mgz.mgz7_gui, style = "bold" },
		NvimTreeGitDirty = { fg = mgz.mgz15_gui },
		NvimTreeGitNew = { fg = mgz.mgz14_gui },
		NvimTreeImageFile = { fg = mgz.mgz15_gui },
		NvimTreeExecFile = { fg = mgz.mgz14_gui },
		NvimTreeSpecialFile = { fg = mgz.mgz9_gui, style = "underline" },
		NvimTreeFolderName = { fg = mgz.mgz10_gui },
		NvimTreeEmptyFolderName = { fg = mgz.mgz1_gui },
		NvimTreeFolderIcon = { fg = mgz.mgz4_gui },
		NvimTreeIndentMarker = { fg = mgz.mgz1_gui },
		LspDiagnosticsError = { fg = mgz.mgz11_gui },
		LspDiagnosticsWarning = { fg = mgz.mgz15_gui },
		LspDiagnosticsInformation = { fg = mgz.mgz10_gui },
		LspDiagnosticsHint = { fg = mgz.mgz9_gui },

		-- WhichKey
		WhichKey = { fg = mgz.mgz4_gui, style = "bold" },
		WhichKeyGroup = { fg = mgz.mgz4_gui },
		WhichKeyDesc = { fg = mgz.mgz7_gui, style = "italic" },
		WhichKeySeperator = { fg = mgz.mgz4_gui },
		WhichKeyFloating = { bg = mgz.float },
		WhichKeyFloat = { bg = mgz.float },

		-- LspSaga
		DiagnosticError = { fg = mgz.mgz11_gui },
		DiagnosticWarning = { fg = mgz.mgz15_gui },
		DiagnosticInformation = { fg = mgz.mgz10_gui },
		DiagnosticHint = { fg = mgz.mgz9_gui },
		DiagnosticTruncateLine = { fg = mgz.mgz4_gui },
		LspFloatWinNormal = { bg = mgz.mgz2_gui },
		LspFloatWinBorder = { fg = mgz.mgz9_gui },
		LspSagaBorderTitle = { fg = mgz.mgz8_gui },
		LspSagaHoverBorder = { fg = mgz.mgz10_gui },
		LspSagaRenameBorder = { fg = mgz.mgz14_gui },
		LspSagaDefPreviewBorder = { fg = mgz.mgz14_gui },
		LspSagaCodeActionBorder = { fg = mgz.mgz7_gui },
		LspSagaFinderSelection = { fg = mgz.mgz14_gui },
		LspSagaCodeActionTitle = { fg = mgz.mgz10_gui },
		LspSagaCodeActionContent = { fg = mgz.mgz9_gui },
		LspSagaSignatureHelpBorder = { fg = mgz.mgz13_gui },
		ReferencesCount = { fg = mgz.mgz9_gui },
		DefinitionCount = { fg = mgz.mgz9_gui },
		DefinitionIcon = { fg = mgz.mgz7_gui },
		ReferencesIcon = { fg = mgz.mgz7_gui },
		TargetWord = { fg = mgz.mgz8_gui },

		-- Sneak
		Sneak = { fg = mgz.mgz0_gui, bg = mgz.mgz4_gui },
		SneakScope = { bg = mgz.mgz1_gui },

		-- Cmp
		CmpItemKind = { fg = mgz.mgz15_gui },
		CmpItemAbbrMatch = { fg = mgz.mgz5_gui, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = mgz.mgz5_gui, style = "bold" },
		CmpItemAbbr = { fg = mgz.mgz4_gui },
		CmpItemMenu = { fg = mgz.mgz14_gui },

		-- Indent Blankline
		IndentBlanklineChar = { fg = mgz.mgz3_gui },
		IndentBlanklineContextChar = { fg = mgz.mgz10_gui },

		-- Illuminate
		illuminatedWord = { bg = mgz.mgz3_gui },
		illuminatedCurWord = { bg = mgz.mgz3_gui },

		-- nvim-dap
		DapBreakpoint = { fg = mgz.mgz14_gui },
		DapStopped = { fg = mgz.mgz15_gui },

		-- nvim-dap-ui
		DapUIVariable = { fg = mgz.mgz4_gui },
		DapUIScope = { fg = mgz.mgz8_gui },
		DapUIType = { fg = mgz.mgz9_gui },
		DapUIValue = { fg = mgz.mgz4_gui },
		DapUIModifiedValue = { fg = mgz.mgz8_gui },
		DapUIDecoration = { fg = mgz.mgz8_gui },
		DapUIThread = { fg = mgz.mgz8_gui },
		DapUIStoppedThread = { fg = mgz.mgz8_gui },
		DapUIFrameName = { fg = mgz.mgz4_gui },
		DapUISource = { fg = mgz.mgz9_gui },
		DapUILineNumber = { fg = mgz.mgz8_gui },
		DapUIFloatBorder = { fg = mgz.mgz8_gui },
		DapUIWatchesEmpty = { fg = mgz.mgz11_gui },
		DapUIWatchesValue = { fg = mgz.mgz8_gui },
		DapUIWatchesError = { fg = mgz.mgz11_gui },
		DapUIBreakpointsPath = { fg = mgz.mgz8_gui },
		DapUIBreakpointsInfo = { fg = mgz.mgz8_gui },
		DapUIBreakpointsCurrentLine = { fg = mgz.mgz8_gui },
		DapUIBreakpointsLine = { fg = mgz.mgz8_gui },

		-- Hop
		HopNextKey = { fg = mgz.mgz4_gui, style = "bold" },
		HopNextKey1 = { fg = mgz.mgz8_gui, style = "bold" },
		HopNextKey2 = { fg = mgz.mgz4_gui },
		HopUnmatched = { fg = mgz.mgz3_gui },

		-- Fern
		FernBranchText = { fg = mgz.mgz3_gui_bright },

		-- nvim-ts-rainbow
		rainbowcol1 = { fg = mgz.mgz15_gui },
		rainbowcol2 = { fg = mgz.mgz13_gui },
		rainbowcol3 = { fg = mgz.mgz11_gui },
		rainbowcol4 = { fg = mgz.mgz7_gui },
		rainbowcol5 = { fg = mgz.mgz8_gui },
		rainbowcol6 = { fg = mgz.mgz15_gui },
		rainbowcol7 = { fg = mgz.mgz13_gui },

		-- lightspeed
		LightspeedLabel = { fg = mgz.mgz8_gui, style = "bold" },
		LightspeedLabelOverlapped = { fg = mgz.mgz8_gui, style = "bold,underline" },
		LightspeedLabelDistant = { fg = mgz.mgz15_gui, style = "bold" },
		LightspeedLabelDistantOverlapped = { fg = mgz.mgz15_gui, style = "bold,underline" },
		LightspeedShortcut = { fg = mgz.mgz10_gui, style = "bold" },
		LightspeedShortcutOverlapped = { fg = mgz.mgz10_gui, style = "bold,underline" },
		LightspeedMaskedChar = { fg = mgz.mgz4_gui, bg = mgz.mgz2_gui, style = "bold" },
		LightspeedGreyWash = { fg = mgz.mgz3_gui_bright },
		LightspeedUnlabeledMatch = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui },
		LightspeedOneCharMatch = { fg = mgz.mgz8_gui, style = "bold,reverse" },
		LightspeedUniqueChar = { style = "bold,underline" },

		-- copilot
		CopilotLabel = { fg = mgz.mgz3_gui, bg = mgz.none },

		-- Statusline
		StatusLineDull = { fg = mgz.mgz3_gui, bg = mgz.mgz1_gui },
		StatusLineAccent = { fg = mgz.mgz0_gui, bg = mgz.mgz13_gui },

		-- mini.nvim
		MiniCompletionActiveParameter = { style = "underline" },

		MiniCursorword = { bg = mgz.mgz3_gui },
		MiniCursorwordCurrent = { bg = mgz.mgz3_gui },

		MiniIndentscopeSymbol = { fg = mgz.mgz10_gui },
		MiniIndentscopePrefix = { style = "nocombine" }, -- Make it invisible

		MiniJump = { fg = mgz.mgz0_gui, bg = mgz.mgz4_gui },

		MiniJump2dSpot = { fg = mgz.mgz12_gui, style = "bold,nocombine" },

		MiniStarterCurrent = { style = "nocombine" },
		MiniStarterFooter = { fg = mgz.mgz14_gui, style = "italic" },
		MiniStarterHeader = { fg = mgz.mgz9_gui },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { fg = mgz.mgz4_gui },
		MiniStarterItemPrefix = { fg = mgz.mgz15_gui },
		MiniStarterSection = { fg = mgz.mgz4_gui },
		MiniStarterQuery = { fg = mgz.mgz10_gui },

		MiniStatuslineDevinfo = { fg = mgz.mgz4_gui, bg = mgz.mgz2_gui },
		MiniStatuslineFileinfo = { fg = mgz.mgz4_gui, bg = mgz.mgz2_gui },
		MiniStatuslineFilename = { fg = mgz.mgz4_gui, bg = mgz.mgz1_gui },
		MiniStatuslineInactive = { fg = mgz.mgz4_gui, bg = mgz.mgz0_gui, style = "bold" },
		MiniStatuslineModeCommand = { fg = mgz.mgz0_gui, bg = mgz.mgz15_gui, style = "bold" },
		MiniStatuslineModeInsert = { fg = mgz.mgz1_gui, bg = mgz.mgz4_gui, style = "bold" },
		MiniStatuslineModeNormal = { fg = mgz.mgz1_gui, bg = mgz.mgz9_gui, style = "bold" },
		MiniStatuslineModeOther = { fg = mgz.mgz0_gui, bg = mgz.mgz13_gui, style = "bold" },
		MiniStatuslineModeReplace = { fg = mgz.mgz0_gui, bg = mgz.mgz11_gui, style = "bold" },
		MiniStatuslineModeVisual = { fg = mgz.mgz0_gui, bg = mgz.mgz7_gui, style = "bold" },

		MiniSurround = { link = "IncSearch" },

		MiniTablineCurrent = { bg = mgz.mgz1_gui },
		MiniTablineFill = { link = "TabLineFill" },
		MiniTablineHidden = { bg = mgz.mgz0_gui, fg = mgz.mgz3_gui },
		MiniTablineModifiedCurrent = { bg = mgz.mgz1_gui, fg = mgz.mgz15_gui },
		MiniTablineModifiedHidden = { bg = mgz.mgz0_gui, fg = mgz.mgz15_gui },
		MiniTablineModifiedVisible = { bg = mgz.mgz2_gui, fg = mgz.mgz15_gui },
		MiniTablineTabpagesection = { fg = mgz.mgz10_gui, bg = mgz.mgz6_gui, style = "reverse,bold" },
		MiniTablineVisible = { bg = mgz.mgz2_gui },

		MiniTestEmphasis = { style = "bold" },
		MiniTestFail = { fg = mgz.mgz11_gui, style = "bold" },
		MiniTestPass = { fg = mgz.mgz14_gui, style = "bold" },

		MiniTrailspace = { bg = mgz.mgz11_gui },


        -- Aerail
        AerialLine = {bg = mgz.mgz2_gui},
        AerialLineNC = {bg = mgz.mgz2_gui},
        
        AerialArrayIcon = { fg = mgz.mgz13_gui },
        AerialBooleanIcon = { fg = mgz.mgz9_gui, style = "bold" },
        AerialClassIcon = { fg = mgz.mgz9_gui },
        AerialConstansIcon = { fg = mgz.mgz13_gui },
        AerialConstructorIcon = { fg = mgz.mgz9_gui },
        AerialEnumIcon = { fg = mgz.mgz9_gui },
        AerialEnumMemberIcon = { fg = mgz.mgz4_gui },
        AerialEventIcon = { fg = mgz.mgz9_gui },
        AerialFieldIcon = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic"} or {fg = mgz.mgz4_gui },
        AerialFileIcon = { fg = mgz.mgz14_gui },
        AerialFunctionIcon = vim.g.mgz_italic and { fg = mgz.mgz8_gui, style = "italic" } or { fg = mgz.mgz8_gui },
        AerialInterfaceIcon = { fg = mgz.mgz9_gui },
        AerialKeyIcon = { fg = mgz.mgz9_gui },
        AerialMethodIcon = vim.g.mgz_italic and  { fg = mgz.mgz7_gui, style = "italic" } or {fg = mgz.mgz7_gui },
        AerialModuleIcon = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic" } or { fg = mgz.mgz4_gui },
        AerialNamespaceIcon = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic" } or { fg = mgz.mgz4_gui },
        AerialNullIcon = { fg = mgz.mgz9_gui },
        AerialNumberIcon = { fg = mgz.mgz15_gui },
        AerialObjectIcon = { fg = mgz.mgz9_gui },
        AerialOperatorIcon = { fg = mgz.mgz9_gui },
        AerialPackageIcon = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic" } or { fg = mgz.mgz4_gui },
        AerialPropertyIcon = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic" } or { fg = mgz.mgz10_gui },
        AerialStringIcon = vim.g.mgz_italic and { fg = mgz.mgz14_gui, style = "italic" } or { fg = mgz.mgz14_gui },
        AerialStructIcon = { fg = mgz.mgz9_gui },
        AerialTypeParameterIcon = { fg = mgz.mgz10_gui },
        AerialVariableIcon = {fg = mgz.mgz4_gui, style = "bold"},

        AerialArray = { fg = mgz.mgz13_gui },
        AerialBoolean = { fg = mgz.mgz9_gui, style = "bold" },
        AerialClass = { fg = mgz.mgz9_gui },
        AerialConstans = { fg = mgz.mgz13_gui },
        AerialConstructor = { fg = mgz.mgz9_gui },
        AerialEnum = { fg = mgz.mgz9_gui },
        AerialEnumMember = { fg = mgz.mgz4_gui },
        AerialEvent = { fg = mgz.mgz9_gui },
        AerialField = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic"} or {fg = mgz.mgz4_gui },
        AerialFile = { fg = mgz.mgz14_gui },
        AerialFunction = vim.g.mgz_italic and { fg = mgz.mgz8_gui, style = "italic" } or { fg = mgz.mgz8_gui },
        AerialInterface = { fg = mgz.mgz9_gui },
        AerialKey = { fg = mgz.mgz9_gui },
        AerialMethod = vim.g.mgz_italic and  { fg = mgz.mgz7_gui, style = "italic" } or {fg = mgz.mgz7_gui },
        AerialModule = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic" } or { fg = mgz.mgz4_gui },
        AerialNamespace = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic" } or { fg = mgz.mgz4_gui },
        AerialNull = { fg = mgz.mgz9_gui },
        AerialNumber = { fg = mgz.mgz15_gui },
        AerialObject = { fg = mgz.mgz9_gui },
        AerialOperator = { fg = mgz.mgz9_gui },
        AerialPackage = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic" } or { fg = mgz.mgz4_gui },
        AerialProperty = vim.g.mgz_italic and  { fg = mgz.mgz4_gui, style = "italic" } or { fg = mgz.mgz10_gui },
        AerialString = vim.g.mgz_italic and { fg = mgz.mgz14_gui, style = "italic" } or { fg = mgz.mgz14_gui },
        AerialStruct = { fg = mgz.mgz9_gui },
        AerialTypeParameter = { fg = mgz.mgz10_gui },
        AerialVariable = {fg = mgz.mgz4_gui, style = "bold"},
	}
	-- Options:

	-- Disable nvim-tree background
	if vim.g.mgz_disable_background then
		plugins.NvimTreeNormal = { fg = mgz.mgz4_gui, bg = mgz.none }
	else
		plugins.NvimTreeNormal = { fg = mgz.mgz4_gui, bg = mgz.sidebar }
	end

	if vim.g.mgz_enable_sidebar_background then
		plugins.NvimTreeNormal = { fg = mgz.mgz4_gui, bg = mgz.sidebar }
	else
		plugins.NvimTreeNormal = { fg = mgz.mgz4_gui, bg = mgz.none }
	end

	return plugins
end

return theme
