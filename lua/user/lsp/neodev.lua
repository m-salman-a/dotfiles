local ok, neodev = pcall(require, "neodev")
if not ok then
  print("Neodev could not be initialized")
end

neodev.setup()
