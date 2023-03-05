local colorscheme = "onedark"

local ok = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
  print(string.format("The colorscheme (%s) had an error", colorscheme))
end
