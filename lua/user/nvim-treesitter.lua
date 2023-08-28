local ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  print("Nvim-treesitter could not be initialized")
  return
end

nvim_treesitter.setup {
  ensure_installed = { "lua", "vim", "help", "yaml", "json" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    incremental_selection = {
      enable = true
    },
    indent = {
      enable = true
    },
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
  }
}

