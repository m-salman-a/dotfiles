local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  print("Nvim-tree could not be initialized")
  return
end

nvim_tree.setup {
  view = {
    relativenumber = true,
  },
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true
  },
}

vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})


