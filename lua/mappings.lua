local opts = { silent = true }      -- 'remap = false' by default (check?)
-- local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- map space as leader key, and ',' as localleader key (for Nvim-R) 
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- better window navigation (normal mode)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize window with arrow (normal mode)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- buffer navigation (normal mode)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)
keymap("n", "<S-Right>", ":bnext<CR>", opts)

-- buffer delete (normal mode)
keymap("n", "<leader>q", ":Bdelete<CR>", opts)

-- close split without deleting buffer
keymap("n", "<leader>d", "<C-w>c", opts)

-- indent line(s) (visual mode)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down (visual mode)
keymap("v", "<A-Up>", ":m .+1<CR>==", opts)
keymap("v", "<A-Down>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- telescope (normal mode)
keymap("n", "ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "bb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "FF", ":Telescope find_files cwd=~<cr>", opts)
keymap("n", "fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "FG", ":Telescope live_grep cwd=~<cr>", opts)
keymap("n", "fh", "<cmd>lua require('telescope.builtin').highlights()<cr>", opts)
keymap("n", "gt", "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)

-- lf (normal mode)
-- keymap("n", "<leader>e", ":Lf<cr>", opts)                           -- toggle
-- keymap("n", "<leader>p", ":Lf ~/Documents/Projects<cr>", opts)        -- Projects
-- keymap("n", "<leader>n", ":Lf ~/Documents/Notes<cr>", opts)           -- Notes

-- nvimtree (normal mode)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)                           -- toggle
keymap("n", "<leader>c", ":NvimTreeOpen ~/.config<cr>", opts)                   -- config
keymap("n", "<leader>p", ":NvimTreeOpen ~/Projects<cr>", opts)        -- Projects
keymap("n", "<leader>n", ":NvimTreeOpen ~/Documents/Notes<cr>", opts)           -- Notes

-- startify (normal mode)
keymap("n", "<leader>a", ":Alpha<cr>", opts)

-- disable highlight
keymap("n", "<leader>h", ":noh<cr>", opts)

-- load/source config
keymap("n", "<leader>ev", ":e $MYVIMRC<cr>", opts)
keymap("n", "<leader>sv", ":so $MYVIMRC<cr>", opts)

-- disable ctrl+z backgrounding
keymap("n", "<C-z>", "<nop>", opts)
keymap("i", "<C-z>", "<nop>", opts)
