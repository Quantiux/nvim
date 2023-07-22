----------------------------------------
-- general appearance and functionality
----------------------------------------
require "settings"                          -- basic settings
require "mappings"                          -- keymaps
require "plugins"                           -- packer
require "configs.impatient"                 -- impatient
require "configs.lualine"                   -- lualine
require "configs.toggleterm"                -- toggleterm
require "configs.startify"                  -- startify
require "configs.bufferline"                -- bufferline
require "configs.colorizer"                 -- colorizer
require "configs.indentline"                -- indent blankline
require "configs.comment"                   -- comment
require "configs.aerial"                    -- aerial
-- require "configs.whichkey"               -- which-key
--------------
-- colorscheme
--------------
require "configs.onedarkpro"                -- onedarkpro
-- require "configs.gruvbox-flat"              -- gruvbox-flat
-----------------
-- file explorer
-----------------
require "configs.nvimtree"                  -- nvim-tree
require "configs.telescope"                 -- telescope
--------------------------------
-- coding, editing, note-taking
--------------------------------
require "configs.treesitter"                -- treesitter
require "configs.nvimr"                     -- Nvim-R
require "configs.cmp"                       -- completion
require "configs.cmpnvimr"                  -- Nvim-R completion
require "configs.lsp"                       -- lsp
require "configs.autopairs"                 -- autopairs
require "configs.gitsigns"                  -- gitsigns
