local ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  print("Nvim-treesitter could not be initialized")
  return
end

nvim_treesitter.setup {
  ensure_installed = { "lua", "vim", "help", "dart", "yaml", "json" },

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,

    incremental_selection = {
      enable = true
    },

    indent = {
      enable = true
    }
  }
}



