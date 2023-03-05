M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
end

M.on_attach = on_attach

M.capabilities = {}

local ok, cmp = pcall(require, "cmp_nvim_lsp")
if not ok then
  print("Cmp-nvim-lsp could not be initialized")
else
  local capabilities = cmp.default_capabilities()
  M.capabilities = capabilities
end

return M
