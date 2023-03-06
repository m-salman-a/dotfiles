local ok, which_key = pcall(require, "which-key")
if not ok then
  print("Which-key could not be initialized")
  return
end

which_key.setup()
