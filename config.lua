-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.plugins = {
    {
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.diagnostics.erb_lint,
                    null_ls.builtins.diagnostics.eslint_d,
                    null_ls.builtins.diagnostics.rubocop,
                    null_ls.builtins.formatting.rubocop,
                    null_ls.builtins.formatting.rustfmt
                },
            })
            vim.keymap.set("n", "<leader>kf", vim.lsp.buf.format, {})
        end,
    },
    {
        "ThePrimeagen/harpoon"
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    --  {
    --      "folke/tokyonight.nvim"
    -- },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]] },

        -- If you have a recent version of lazy.nvim, you don't need to add this!
        build = "nvim -l build/init.lua",
        config = function()
            require("sg").setup {
            }
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
    -- {
    --     "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000
    -- },
    {

        'windwp/nvim-ts-autotag',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                autotag = {
                    enable = true,
                    enable_rename = true,
                    enable_close = true,
                    enable_close_on_slash = true,
                }
            }
        end
    }
}

-- -- Nightfly Theme configuration
-- vim.g.nightflyItalics = true
-- vim.g.nightflyItalics = true
-- vim.g.nightflyTransparent = true
-- vim.g.nightflyTerminalColors = true
-- vim.g.nightflyUnderlineMatchParen = true


-- color scheme setup
lvim.colorscheme = vim.cmd [[colorscheme rose-pine]]
lvim.transparent_window = true

-- lvim.keys.normal_mode["<C-pv>"] = ":Ex"
vim.api.nvim_set_keymap('n', "<C-pv>", '<cmd>:Ex<cr>', { noremap = true, silent = true })
-- setting a transparent background
vim.api.nvim_set_hl(0, "normal", { bg = "none" })
vim.api.nvim_set_hl(0, "normalfloat", { bg = "none" })

-- Must have : displays number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabultation stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true


-- Set undotree to handle backups in long time
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.wrap = true

vim.g.mapleader = " "


-- //////////// LSP BUF CODE ACTIONS
-- ////////////// DOC : Shift K -> Documentation
-- ////////////// DOC : Ctrl X + Ctrl O -> Autocompletion suggestion based on
-- LSP
vim.keymap.set({ "n", "v" }, "L", vim.lsp.buf.code_action, {})

-- ///////////////// The ThePrimeagen Config
-- fugitive
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Add file to harpoon
vim.keymap.set("n", "<Leader>!", mark.add_file)
-- Open Harpoon menu
vim.keymap.set("n", "<Leader>0", ui.toggle_quick_menu)
vim.keymap.set("n", "<Leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<Leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<Leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<Leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<Leader>5", function() ui.nav_file(5) end)


-- /////////////////////////////////////
-- Telescope Remap
-- Open Telecrope with Control K
vim.api.nvim_set_keymap('n', '<Space>kk', '<cmd>Telescope<cr>', { noremap = true, silent = true })
--
-- Open References / Usages with U
vim.api.nvim_set_keymap('n', '<Space>ku', '<cmd>Telescope lsp_references<cr>', { noremap = true, silent = true })
--
-- Open Symboles, definitions in document with D
vim.api.nvim_set_keymap('n', '<Space>kd', '<cmd>Telescope lsp_document_symbols<cr>', { noremap = true, silent = true })
--
-- Open Suggestions / Spellings with S
vim.api.nvim_set_keymap('n', '<Space>ks', '<cmd>Telescope spell_suggest<cr>', { noremap = true, silent = true })
--
-- Open  Registery /Yank with Y
vim.api.nvim_set_keymap('n', '<Space>ky', '<cmd>Telescope registers<cr>', { noremap = true, silent = true })
--
-- Open Diagnostics / Troubles with X
vim.api.nvim_set_keymap('n', '<Space>kx', '<cmd>Telescope diagnostics<cr>', { noremap = true, silent = true })
--
-- Open Jumplist / Positions with J
vim.api.nvim_set_keymap('n', '<Space>kj', '<cmd>Telescope jumplist<cr>', { noremap = true, silent = true })
--
-- Open Marks with M
vim.api.nvim_set_keymap('n', '<Space>km', '<cmd>Telescope marks<cr>', { noremap = true, silent = true })



-- /////////////////////////////////////
-- Custom warp function --
-- define the function
function WrapWithTag(tag)
    local start_line, end_line = unpack(vim.fn.getpos("'<"), 2, 3)
    local end_line_pos = unpack(vim.fn.getpos("'>"), 2, 3)
    if end_line_pos == 0 then
        end_line = end_line + 1
    end
    vim.api.nvim_command(start_line .. ',' .. end_line .. 's/\\%V.*\\%V/' .. '<' .. tag .. '>' .. '&<\\/' .. tag .. '>/')
end

-- define the command to call the function
vim.cmd [[
command! -nargs=1 -range Wrap call v:lua.WrapWithTag(<f-args>)
]]

-- define the keymap
vim.api.nvim_set_keymap('v', '<Space>w', [[:'<,'>Wrap ]], { noremap = true, silent = false })


-- /////////////////////////////////////////
-- Move Selection to new file --
_G.move_text_to_new_file = function()
    -- Cut the current visual selection
    vim.cmd('normal! "xx')

    -- Prompt for file path
    vim.fn.inputsave()
    local file = vim.fn.input('Path: ')
    vim.fn.inputrestore()
    if file ~= "" then
        vim.cmd('e ' .. file)
    end
end

-- test de doc
-- Map <C-r> in visual mode to the Lua function
vim.api.nvim_set_keymap('v', '<Space>m', ':lua _G.move_text_to_new_file()<CR>', { noremap = true, silent = true })

-- ////////////////////////// FIX HIGHLIGHT ENHANCE COLOR AND ADD COMMAND /////////////////////////
--
-- Set the highlight for Visual mode
vim.cmd([[
  hi Visual guibg=#0891B2 guifg=white
]])

-- Set the custom colors for search results
vim.cmd([[
  hi Search guibg=#B45309 guifg=white
]])

-- Toggle hlsearch
function ToggleHighlightSearch()
    vim.cmd("nohlsearch")
    local hlsearch_state = vim.o.hlsearch
    vim.o.hlsearch = not hlsearch_state

    if vim.o.hlsearch then
        print("Highlight search is ON")
    else
        print("Highlight search is OFF")
    end
end

-- Map the function to a key, for example, <leader>h
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua ToggleHighlightSearch()<cr>', { noremap = true, silent = true })
--
-- ///////////////////////////////////////////////////
