local colorscheme = "tokyonight-storm"

local ok = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
  print(string.format("The colorscheme (%s) could not be initialized", colorscheme))
end
