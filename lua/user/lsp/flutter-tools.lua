local ok, flutter_tools = pcall(require, "flutter-tools")
if not ok then
  print("Flutter-tools could not be initialized")
  return
end

local handlers = require("user.lsp.handlers")

flutter_tools.setup {
  lsp = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }
}

