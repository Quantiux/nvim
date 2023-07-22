local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer. Close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Call to packer failed!")
	return
end

-- have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- install plugins here
return packer.startup(function(use)

    ---------------------------------------
    -- general appearance and functionality
    ---------------------------------------
    use { "wbthomason/packer.nvim", commit = "dac4088c70f4337c6c40d1a2751266a324765797" }
    use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }
    use { "nvim-tree/nvim-web-devicons", commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622" }
    use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }    -- to use Bdelete
    use { "nvim-lualine/lualine.nvim", commit = "fffbcb829288c3ca366f17cdb8d46aefb5c1d6f3" }
    use { "akinsho/toggleterm.nvim", commit = "42438b30421035753ea86d5ec1a36d88019d5bac" }
    use { "lewis6991/impatient.nvim", commit = "9f7eed8133d62457f7ad2ca250eb9b837a4adeb7" }
    use { "akinsho/bufferline.nvim", commit = "c7492a76ce8218e3335f027af44930576b561013" }
    use { "goolord/alpha-nvim", commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb" }
    use { "NvChad/nvim-colorizer.lua", commit = "760e27df4dd966607e8fb7fd8b6b93e3c7d2e193" }
    use { "lukas-reineke/indent-blankline.nvim", commit = "39bb0d428aa4622fa0a4670506d2307165f1908e" }
    use { "numToStr/Comment.nvim", commit = "6821b3ae27a57f1f3cf8ed030e4a55d70d0c4e43" }
    use { "stevearc/aerial.nvim", commit = "a467e9a06aa92db81812f4c2c26364877bbafb80" }
    -- use { "folke/which-key.nvim", commit = "" }
    --------------------------------
    -- theme
    --------------------------------
    use { "olimorris/onedarkpro.nvim", commit = "eb5edd67fa658e45045d248a93e6303cdc23d997" }
    -- use { "eddyekofo94/gruvbox-flat.nvim", commit = "172269867994c0da7adcf02e89a068cda85eb805" }
    -------------------
    -- file explorer
    -------------------
    use { "nvim-tree/nvim-tree.lua", commit = "9e4c39572f631bb60ee15cb9d46e1daa9927a45e" }
    use { "nvim-telescope/telescope.nvim", commit = "e960efa60e97df58e089b00270f09d60f27202c8" }
    use { "nvim-telescope/telescope-fzf-native.nvim",
          commit = "fab3e2212e206f4f8b3bbaa656e129443c9b802e",
          run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
          cmake --build build --config Release && cmake --install build --prefix build"
    }
    ---------------------------------
    -- coding, editing
    ---------------------------------
    use { "nvim-treesitter/nvim-treesitter",
          commit = "48a3da710369688df80beb2847dabbbd02e2180e",
          run = ":TSUpdate"
    }
    use { "jalvesaq/Nvim-R", commit = "4fab6ae9b2de84809a98047d06562d3d1d902346" }
    use { "lewis6991/gitsigns.nvim", commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d" }
    use { "windwp/nvim-autopairs", commit = "b5994e6547d64f781cfca853a1aa6174d238fe0e" }
    ---------------------------------
    -- completion
    ---------------------------------
    use { "hrsh7th/nvim-cmp", commit = "d09b0c396aaa078cdfe78316ec06940971136e85" }
    use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }
    use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }
    use { "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" }
    use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
    use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }
    use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }
    use { "jalvesaq/cmp-nvim-r", commit = "240d8e3c9c7408646a4c7e1d4e48b3d236e27afe" }
    ---------------------------------
    -- snippets
    ---------------------------------
    use { "L3MON4D3/LuaSnip", commit = "5570fd797eae0790affb54ea669a150cad76db5d" }
    use { "rafamadriz/friendly-snippets", commit = "1a6a02350568d6830bcfa167c72f9b6e75e454ae" }
    ---------------------------------------------------
    -- lsp (*** top 3 must be in this exact order ***)
    ---------------------------------------------------
    use { "williamboman/mason.nvim", commit = "d6bc653251fe1aee16435fafc30170802b63d51f" }
    use { "williamboman/mason-lspconfig.nvim", commit = "fc78caa46e306103818137759afcc908ab6be948" }
    use { "neovim/nvim-lspconfig", commit = "011e51b33d667bd36591833a2c5d20bbe18fbfc5" }
    use { "jose-elias-alvarez/null-ls.nvim", commit = "b26851b3e7ac1c0c85666f8a74e36aef2acb89c6" }
    use { "RRethy/vim-illuminate", commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" }

	-- automatically set up configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
