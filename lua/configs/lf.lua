local status_ok, lf = pcall(require, "lf")
if not status_ok then
    vim.notify("lf plugin not found!")
	return
end

vim.g.lf_netrw = 1              -- replace netrw

lf.setup({
  default_cmd = "lf",           -- default `lf` command
  default_action = "edit",      -- default action when `Lf` opens a file
  default_actions = {           -- default action keybindings
    ["<C-t>"] = "tabedit",
    ["<C-x>"] = "split",
    ["<C-v>"] = "vsplit",
    ["<C-o>"] = "tab drop",
  },

  winblend = 10,                -- psuedotransparency level
  dir = "",                     -- "" is CWD, "gwd" is Git-WD
  direction = "float",          -- window type: float horizontal vertical
  border = "rounded",           -- single/double/shadow/curved/rounded
  height = 0.85,                -- height of the *floating* window
  width = 0.85,                 -- width of the *floating* window
  escape_quit = true,           -- map <esc> to the quit command
  focus_on_open = false,        -- focus current file when opening Lf (experimental)
  mappings = true,  -- whether terminal buffer mapping is enabled
  tmux = false,     -- keep tmux statusline on opening of Lf

  vim.keymap.set("n", "<leader>e", ":Lf<CR>")
})
