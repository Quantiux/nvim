----------------------------------------------------------------------------
-- plugin to inject LSP diagnostics, formatting, code action etc via lua
----------------------------------------------------------------------------
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    vim.notify("null-ls plugin not found!")
	return
end

-- use <leader>f to format (see file 'handlers.lua')
-- binaries (e.g. black, isort, flake8/pylint for python) MUST BE installed first
null_ls.setup({
    -- border = "rounded",
	debug = false,
	sources = {
        null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length=100", "--ignore=E402" } }),
        -- null_ls.builtins.diagnostics.pylint.with({ extra_args = { "--max-line-length=100", "--ignore=E402" } }),
        null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),  -- https://github.com/psf/black#usage
        -- null_ls.builtins.formatting.isort,
        -------------------------------------
        -- null_ls.builtins.diagnostics.selene,
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.yamllint,
        -- null_ls.builtins.formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	},
})
