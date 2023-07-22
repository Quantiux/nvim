local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("treesitter plugin not loaded!")
	return
end

configs.setup({
	ensure_installed = { "bash", "help", "lua", "norg", "python", "r", "vim", "yaml" },
	ignore_install = { "" },        -- if ensure_installed = "all"
	highlight = {
		enable = true,              -- false will disable the whole extension
		-- disable = { "yaml" },       -- yaml highlight italicizes all ! (FIXED!!)
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python" } },  -- python indent works when disabled here
})
