local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify("comment plugin not loaded!")
  return
end

comment.setup {
  padding = true,   -- add a space b/w comment and line
  sticky = true,    -- if cursor should stay at its position
  ignore = nil,     -- lines to be ignored while (un)comment
  toggler = {
    line = 'gcc',   -- line-comment toggle keymap
    block = 'gbc',  -- block-comment toggle keymap
  },
  opleader = {
    line = 'gc',    -- line-comment keymap
    block = 'gb',   -- block-comment keymap
  },
  extra = {
    eol = 'gcA',    -- add comment at end of line
    above = 'gcO',  -- add comment on line above
    below = 'gco',  -- add comment on line below
  },
}

