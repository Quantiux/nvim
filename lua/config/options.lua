local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true

-- Search
opt.incsearch = true
opt.ignorecase = true -- ignore case in search pattern
opt.smartcase = true
opt.hlsearch = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true -- most terms support this
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 0 -- disable commandline (below statusline)
opt.scrolloff = 0
opt.completeopt = "menuone,noinsert,noselect"
opt.showmode = false -- disable mode -- INSERT -- etc below statusline

-- Behavior
opt.wrap = true
opt.linebreak = true -- break at line instead of splitting words
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = true
opt.backupdir = vim.fn.expand("~/.local/state/nvim/backup")
opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.conceallevel = 2
opt.iskeyword:append("-")
opt.mouse:append("a") -- make mouse available
opt.clipboard = "unnamedplus" -- set system clipboard to "+ (unnamedplus)
opt.modifiable = true
opt.encoding = "UTF-8"
opt.updatetime = 100 -- faster writing of swapfile on disk (default 4000)
opt.whichwrap = "<,>" -- enable cursor to continue after end of line before
