local ok, dap = pcall(require, "dap")
if not ok then
  print("Nvim-dap could not be initialized")
  return
end

local path = require "lspconfig.util".path
--
local debugger_dir = path.join(vim.fn.stdpath("cache"), "dart-code")
local debugger_path = path.join(debugger_dir, "out", "dist", "debug.js")

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = { debugger_path, "flutter" },
}
