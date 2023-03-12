local ok, flutter_tools = pcall(require, "flutter-tools")
if not ok then
  print("Flutter-tools could not be initialized")
  return
end

local handlers = require("user.lsp.handlers")

function _DART_TOGGLE_LOG()
  local wins = vim.api.nvim_list_wins()

  for _, id in pairs(wins) do
    local bufnr = vim.api.nvim_win_get_buf(id)
    if vim.api.nvim_buf_get_name(bufnr):match '.*/([^/]+)$' == '__FLUTTER_DEV_LOG__' then
      return vim.api.nvim_win_close(id, true)
    end
  end

  pcall(function()
    vim.api.nvim_command 'sb + __FLUTTER_DEV_LOG__ | resize 15'
  end)
end

flutter_tools.setup {
  lsp = {
    color = {
      enabled = true,
    },
    on_attach = function(client, bufnr)
      handlers.on_attach(client, bufnr);
      vim.keymap.set("n", "<Leader>tl", "<cmd>lua _DART_TOGGLE_LOG() <CR>")
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.dart" },
        callback = function ()
        callback = function()
          vim.lsp.buf.format { async = false }
        end
      })
    end,
    capabilities = handlers.capabilities,
    settings = {
      analysisExcludedFolders = { "$HOME/Developer/flutter" },
    }
  }
}


