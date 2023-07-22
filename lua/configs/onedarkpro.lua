-- setup must be called before loading the colorscheme
require("onedarkpro").setup({
  options = {
    cursorline = false,
    highlight_inactive_windows = true,
    terminal_colors = true,     -- set neovim terminal colors to this theme
    transparency = false
  },
  styles = {
    types = "NONE",
    methods = "NONE",
    numbers = "NONE",
    strings = "NONE",
    comments = "italic",
    keywords = "bold,italic",
    constants = "NONE",
    functions = "italic",
    operators = "NONE",
    variables = "NONE",
    parameters = "NONE",
    conditionals = "italic",
    virtual_text = "NONE",
  }
})

vim.cmd[[colorscheme onedark_vivid]]

-- set long line (>100 characters) alert
vim.cmd([[
    hi OverLength guibg=#3a404c ctermbg=gray
    match OverLength /\%101v.\+/
]])
