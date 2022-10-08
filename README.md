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
vim.cmd[[colorscheme mgz]]
```

### Configuration

TODO

## ⚙️ Configuration

| Option                              | Default     | Description                                                                                                                                                     |
| ----------------------------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| nord_contrast                   | `false`      | Make sidebars and popup menus like nvim-tree and telescope have a different background                                                                                       |
| nord_borders                    | `false`     | Enable the border between verticaly split windows visable
| nord_disable_background         | `false`     | Disable the setting of background color so that NeoVim can use your terminal background
| nord_cursorline_transparent     | `false`     | Set the cursorline transparent/visible
| nord_enable_sidebar_background  | `false`     | Re-enables the background of the sidebar if you disabled the background of everything
| nord_italic                     | `true`      | enables/disables italics
| nord_uniform_diff_background    | `false`     | enables/disables colorful backgrounds when used in *diff* mode

```lua
-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true

-- Load the colorscheme
require('nord').set()
```


---

The theme is also available for [VSCode](https://github.com/stankovictab/mgz-dark-theme).

Made by @stankovictab.
