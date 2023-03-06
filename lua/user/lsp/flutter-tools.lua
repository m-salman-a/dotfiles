local ok, flutter_tools = pcall(require, "flutter-tools")
if not ok then
  print("Flutter-tools could not be initialized")
  return
end

flutter_tools.setup({})

