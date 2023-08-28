M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
  end

  -- Diagnostics
  nmap("]d", function() vim.diagnostic.goto_next({buffer=0}) end, "Go to next diagnostic message")
  nmap("[d", function() vim.diagnostic.goto_prev({buffer=0}) end, "Go to previous diagnostic message")
  nmap("<Leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
  nmap("<Leader>fd", function() require("telescope.builtin").diagnostics {initial_mode="normal"} end, "[F]ind [D]iagnostics")

  -- Signature
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Goto
  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("gr", function() require("telescope.builtin").lsp_references {initial_mode="normal"} end, "[G]oto [R]eferences")
  nmap("<Leader>fs", function() require("telescope.builtin").lsp_document_symbols {initial_mode="normal"} end, "[F]ind [S]ymbols")
  nmap("<Leader>fm", function() vim.lsp.buf.format { async = true } end)

  -- Less used
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [Declaration]")
  nmap("<Leader>D",  vim.lsp.buf.type_definition, "Type [D]efinition")
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
  ["textDocument/typeDefinition"] = vim.lsp.with(vim.lsp.handlers.type_definition, { border = "rounded" })
}

vim.diagnostic.config {
  float = {
    border = "rounded"
  }
}

return M
