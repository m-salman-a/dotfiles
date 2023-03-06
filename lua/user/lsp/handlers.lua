M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Keymaps
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
  vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
  vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
  vim.keymap.set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", bufopts)
  vim.keymap.set("n", "<Leader>]d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", bufopts)
  vim.keymap.set("n", "<Leader>[d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", bufopts)
  vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", bufopts)
  vim.keymap.set("n", "<Leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
  vim.keymap.set("n", "<Leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", bufopts)
  vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
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

M.handlers = {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

vim.diagnostic.config {
  float = {
    border = "rounded"
  }
}

return M
