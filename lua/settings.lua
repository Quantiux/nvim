local set = vim.opt

set.backup = true
set.backupdir = "/home/roy/.local/state/nvim/backup"    -- default
set.clipboard = "unnamedplus"                           -- copy from clipboard
set.cmdheight = 0                                       -- disable commandline (below statusline)
set.completeopt = { "menuone", "noselect" }             -- mostly for cmp plugin
set.cursorline = true
set.expandtab = true                                    -- convert tabs to spaces
set.foldenable = true                                   -- default
-- set.guioptions:append "a"                               -- copy to clipboard
set.ignorecase = true                                   -- ignore case in search pattern
set.mouse = "a"                                         -- allow mouse use in neovim
set.mousemoveevent = true                               -- enable mouse hover
set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.showmatch = true                                    -- show matching brace
set.showtabline = 1                                     -- show tabline only with >1 tab
set.smartcase = true
set.smartindent = true
set.softtabstop = 4
set.spelllang = "en_us"
set.splitright = true
set.swapfile = false
set.tabstop = 4
set.termguicolors = true                                -- most terms support this
set.timeoutlen = 300                                    -- default 1000ms
set.undofile = true
set.undodir = "/home/roy/.local/state/nvim/undo"        -- default
set.updatetime = 300                                    -- faster completion (default 4000ms)
set.wrap = false
-- set.wildmode = longest,list,full

-- disable netrw (for nvim-tree to work)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- cursor wrap around to next line
-- vim.cmd "set whichwrap+=<,>,[,],h,l"
