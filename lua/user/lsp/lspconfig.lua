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

local servers = { "lua_ls", "yamlls", "jsonls" }

mason.setup()

mason_lspconfig.setup {
  ensure_initialized = servers,
  automatic_installation = true
}

local handlers = require("user.lsp.handlers")

for _, lsp in ipairs(servers) do
  local settings = {}

  if lsp == 'lua_ls' then
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
  end

  lspconfig[lsp].setup {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    settings = settings,
  }
end

