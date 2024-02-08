local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


plugins = {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "nvim-telescope/telescope.nvim", tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "typescript", "rust", "python", "go" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 },
{"mbbill/undotree"},
{"tpope/vim-fugitive"},
{'williamboman/mason.nvim'},
{'williamboman/mason-lspconfig.nvim'},
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
}

require("lazy").setup(plugins)
