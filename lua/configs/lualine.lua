local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.notify("lualine plugin not found!")
	return
end

local hide_in_width = function()
  return vim.o.columns > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "hint", "info" },
	symbols = { error = " ", warn = " ", hint = " ", info = " " },
	colored = true,
	update_in_insert = false,
	always_visible = false,
    padding = 0
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "✓ ", modified = "! ", removed = "✘ " }, -- changes diff symbols
    cond = hide_in_width
}

-- local spaces = function()
--     return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

local fileformat = {
	"fileformat",
	icons_enabled = false,
	icon = nil,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local location = {
	"location",
	padding = 0,
}

-------------------------------------------------------------------------------------------
-- add python virtual environment 
-- (https://github.com/nvim-lualine/lualine.nvim/issues/277#issuecomment-1337515821)
-- (https://www.reddit.com/r/neovim/comments/10ger2p/comment/j54q8sc/?utm_source=share&utm_medium=web2x&context=3)
local split = function(input, delimiter)
    local arr = {}
    _ = string.gsub(input, '[^' .. delimiter ..']+', function(w) table.insert(arr, w) end)
    return arr
end

local get_venv = function()
	local venv = vim.env.VIRTUAL_ENV    -- check value with :lua print(vim.env.VIRTUAL_ENV)
	if venv then
		local params = split(venv, '/')     -- split path by '/'
        local name = split(params[#params], '-')   -- split name by '-'
		return '[ '..name[1]..']'
	else
		return ''
	end
end

local get_env = {
    get_venv,
    color = { fg = "#61afef" }
}
-------------------------------------------------------------------------------------------

lualine.setup({
    options = {
        section_separators = { left = ' ', right = ' '},
        component_separators = '',
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		theme = 'onedark_vivid'      -- only if 'onedarkpro' theme is loaded
		-- theme = 'gruvbox-flat'      -- only if 'gruvbox-flat' theme is loaded
    },
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'filename' },
		lualine_c = { diagnostics },
		lualine_x = { diff, fileformat, filetype, get_env },
		-- lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { 'progress' },
	},
})
