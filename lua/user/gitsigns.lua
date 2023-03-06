local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  print("Gitsigns could not be initialized")
  return
end

gitsigns.setup()

