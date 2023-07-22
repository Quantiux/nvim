-- setup must be called before loading the colorscheme
vim.g.gruvbox_terminal_colors = true    -- set colors of neovim terminal
vim.g.gruvbox_italic_comments = true
vim.g.gruvbox_italic_keywords = false
vim.g.gruvbox_italic_variables = false
vim.g.gruvbox_italic_functions = 1      -- | false
vim.g.gruvbox_transparent = false
vim.g.gruvbox_hide_inactive_statusline = true  -- hide inactive statusline
vim.g.gruvbox_sidebars = { "qf" } -- | "vista_kind" | "terminal" | "packer"
vim.g.gruvbox_dark_sidebar = true   -- nvimtree gets a darker background
vim.g.gruvbox_dark_float = true     -- float windows like lsp get a darker background
vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

-- load colorscheme
if(vim.fn.hostname() == "nbook")
then
    vim.g.gruvbox_flat_style = "hard"
else
    vim.g.gruvbox_flat_style = "dark"
end
vim.cmd[[colorscheme gruvbox-flat]]

-- set long line (>100 characters) alert
vim.cmd([[
    hi OverLength guibg=#3c3836 ctermbg=gray
    match OverLength /\%101v.\+/
]])
