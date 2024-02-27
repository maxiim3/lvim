# LunarVim Keymaps and Shortcuts

This document provides a comprehensive overview of the custom keymaps and shortcuts configured in LunarVim. 

## General Keymaps

- **Transparent Background Toggle**: `lvim.transparent_window = true`
- **Number Display**: `vim.opt.nu = true`
- **Relative Number Display**: `vim.opt.relativenumber = true`
- **Tabulation Settings**: 
- Tab Stop: `vim.opt.tabstop = 4`
- Soft Tab Stop: `vim.opt.softtabstop = 4`
- Shift Width: `vim.opt.shiftwidth = 4`
- Expand Tab: `vim.opt.expandtab = true`
- Smart Indent: `vim.opt.smartindent = true`
- **Undo Tree Configuration**: 
- Swap File: `vim.opt.swapfile = false`
- Backup: `vim.opt.backup = false`
- Undo Directory: `vim.opt.undodir`
- Undo File: `vim.opt.undofile = true`
- **Search Settings**: 
- Highlight Search: `vim.opt.hlsearch = false`
- Incremental Search: `vim.opt.incsearch = true`
- **Visual Settings**: 
- Color Column: `vim.opt.colorcolumn = "80"`
- Text Width: `vim.opt.textwidth = 80`
- Line Break: `vim.opt.linebreak = true`
- Wrap: `vim.opt.wrap = true`
- **Leader Key**: `vim.g.mapleader = " "`

## Plugin Keymaps

- **Vim Surround**: `tpope/vim-surround`
- **Harpoon**: 
- Add File: `<Leader>!`
- Toggle Quick Menu: `<Leader>0`
- Navigate Files: `<Leader>1`, `<Leader>2`, `<Leader>3`, `<Leader>4`, `<Leader>5`
- **Telescope**: 
- Open Telescope: `<Space>kk`
- References/Usages: `<Space>ku`
- Document Symbols: `<Space>kd`
- Spell Suggestions: `<Space>ks`
- Registers/Yank: `<Space>ky`
- Diagnostics/Troubles: `<Space>kx`
- Jumplist/Positions: `<Space>kj`
- Marks: `<Space>km`

## Custom Functions

- **Wrap With Tag**: 
- Command: `Wrap`
- Keymap: `<Space>w`
- **Move Selection to New File**: 
- Keymap: `<Space>m`

## LSP Keymaps

- **LSP Buffer Code Actions**: `L`

## Fugitive (Git Integration)

- Harpoon integration with fugitive for enhanced Git workflows.

### Thanks
- Shout out to [Typecraft](https://www.youtube.com/watch?v=S-xzYgTLVJE) for his video
- And to [The Primeagen](https://www.youtube.com/watch?v=X6AR2RMB5tE) for
  sharing his config
