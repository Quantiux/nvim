-- auto-format on save
-- (https://github.com/creativenull/efmls-configs-nvim?tab=readme-ov-file#format-on-save)
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function(ev)
		local efm = vim.lsp.get_clients({ name = "efm", bufnr = ev.buf })
		if vim.tbl_isempty(efm) then
			return
		end
		vim.lsp.buf.format({ name = "efm" })
	end,
})

-- https://github.com/LunarVim/Launch.nvim/blob/master/lua/user/autocmds.lua
-- disable comment on a newline below comment line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- enable highlighting of yanked line
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
	end,
})

-- enable spell checking for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
    vim.opt_local.spellfile = vim.fn.expand("~/.local/share/nvim/spell/en.utf-8.add")
	end,
})
