local ok, lualine = pcall(require, "lualine")
if not ok then
  print("Lualine could not be initialized")
  return
end

lualine.setup()
