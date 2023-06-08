# mgz.nvim

A really dark NeoVim theme.

![theme.png](theme.png) 

### Installation

Install (and update) it through your favourite package manager.\
For example, [packer](https://github.com/wbthomason/packer.nvim).

```lua
use 'stankovictab/mgz.nvim'
```

To enable the colorscheme, you can use the following.\
```vim
" Vim-Script
colorscheme mgz
```

```lua
-- Lua
vim.cmd('colorscheme mgz')
```

### Configuration

The MGZ theme allows for these options to be changed :
- `mgz_disable_background` - Disables the setting of background color, so that NeoVim can use your terminal emulator's background color. Default is false. 
- `mgz_cursorline_transparent` - Set the cursorline to transparent or visible. Default is false. 
- `mgz_italic` - Whether to render text in italics or not. Default is true. 
- `mgz_uniform_diff_background` - Enables or disables colorful backgrounds when used in diff mode. Default is false. 

```lua
-- Example config in lua
vim.g.mgz_disable_background = true
vim.g.mgz_cursorline_transparent = false
vim.g.mgz_italic = false
vim.g.mgz_uniform_diff_background = true
```

### Notices

I usually make changes to this theme depending on the plugins I'm using in my NeoVim config, 
so because that is my priority, I wouldn't theme some of the more obscure plugins that I don't use.\
However, if you want to you can always open an issue or a pull request and I'll try to add support for it.

If you're using an LSP plugin, it might interfere with the colorscheme by applying different syntax highlighting that overrides the theme. You can see [this](https://www.reddit.com/r/neovim/comments/109vgtl/how_to_disable_highlight_from_lsp/) for more info.

---

The structure of the theme is based off of [nord.nvim](https://github.com/shaunsingh/nord.nvim), so there might still be some old code and styling in there.

The MGZ theme is also available for [VSCode](https://github.com/stankovictab/mgz-dark-theme).
