local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  print("Nvim-Tree had an error")
  return
end

nvim_tree.setup()

vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})

