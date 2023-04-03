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
  -- Colorschemes
  {
    "joshdick/onedark.vim",
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
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
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    }
  },

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "nvim-treesitter/playground",
    dependencies = {
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
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    }
  },

  -- Bufferline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
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

  -- Debugger
  {
    "mfussenegger/nvim-dap"
  },

  {
    "m00qek/baleia.nvim"
  },
  {
    "norcalli/nvim-terminal.lua"
  }
}

require("lazy").setup(plugins, {
  ui = {
    border = "rounded"
  }
})
