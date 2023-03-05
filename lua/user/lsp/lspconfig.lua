local ok, mason = pcall(require, "mason")
if not ok then
  print("Mason could not be initialized")
  return
end

local ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok2 then
  print("Mason-lspconfig could not be initialized")
  return
end

local ok3, lspconfig = pcall(require, "lspconfig")
if not ok3 then
  print("Lspconfig could not be initialized")
end

mason.setup()

mason_lspconfig.setup {
  ensure_initialized = { "lua_ls", "yamlls", "jsonls" },

  automatic_installation = true
}

local handlers = require("user.lsp.handlers")

lspconfig.lua_ls.setup {
  on_attach = handlers.on_attach,

  settings = {
    Lua = {
      diagnostics = {
	globals = { "vim" }
      },
      telemetry = {
	enable = false
      }
    }
  }
}

