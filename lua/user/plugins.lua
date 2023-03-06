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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000
  },

  -- Explorer
  {
    "nvim-lua/plenary.nvim"
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

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    }
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
  {
    "folke/neodev.nvim"
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
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

  -- Comments
  {
    "numToStr/Comment.nvim"
  },
  {
    "folke/todo-comments.nvim"
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },

  -- Bufferline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim"
  },
  {
    "f-person/git-blame.nvim"
  },
}

require("lazy").setup(plugins, {
  ui = {
    border = "rounded"
  }
})
