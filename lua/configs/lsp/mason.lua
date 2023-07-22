----------------------------------------------------------------------------
-- plugin to install and manage LSP servers, linters and formatters
----------------------------------------------------------------------------
local servers = {
	"sumneko_lua",              -- for lua script
	"pyright",                  -- for python script
	-- "r_language_server",     -- for r script (use Nvim-R instead)
	"yamlls",                   -- for yaml script
    -- "bashls",                -- for bash script
	-- "cssls",                 -- for css script
	-- "html",                  -- for html script
	-- "jsonls",                -- for json script
	-- "tsserver",              -- for javascript
	-- "intelephense",          -- for php script
	-- "lemminx",               -- for xml script
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    vim.notify("lspconfig plugin not found!")
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("configs.lsp.handlers").on_attach,
		capabilities = require("configs.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "configs.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

require("lspconfig.ui.windows").default_options.border = "rounded"  -- set LspInfo window border
