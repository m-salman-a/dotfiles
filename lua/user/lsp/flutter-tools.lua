local ok, flutter_tools = pcall(require, "flutter-tools")
if not ok then
  print("Flutter-tools could not be initialized")
  return
end

local handlers = require("user.lsp.handlers")

flutter_tools.setup {
  lsp = {
    color = {
      enabled = true,
    },
    on_attach = function(client, bufnr)
      handlers.on_attach(client, bufnr);
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.dart" },
        callback = function ()
          vim.lsp.buf.format { async = false }
        end
      })
    end,
    capabilities = handlers.capabilities,
    settings = {
      completeFunctionCalls = true,
      updateImportsOnRename = true,
      analysisExcludedFolders = {"$HOME/Developer/flutter"},
      renameFilesWithClasses = "prompt",
    }
  }
}


