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

local plugins = {
  {
    "joshdick/onedark.vim",
    lazy = false,
    priority = 1000
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false
  },
  {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "windwp/nvim-autopairs"
  },

  -- LSP
  {
    "williamboman/mason.nvim"
  },
  {
    "williamboman/mason-lspconfig.nvim"
  },
  {
    "neovim/nvim-lspconfig"
  },

  -- CMP
  {
    "hrsh7th/nvim-cmp",
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",

  -- Snippets 
  {
    "L3MON4D3/LuaSnip",
  },

  {
    "RRethy/vim-illuminate"
  }
}

require("lazy").setup(plugins, {
  ui = {
    border = "rounded"
  }
})
