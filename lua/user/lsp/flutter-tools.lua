local ok, flutter_tools = pcall(require, "flutter-tools")
if not ok then
  print("Flutter-tools could not be initialized")
  return
end

local path = require "lspconfig.util".path
local debugger_dir = path.join(vim.fn.stdpath("cache"), "dart-code")
local debugger_path = path.join(debugger_dir, "out", "dist", "debug.js")

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
  fvm = true,
  decorations = {
    statusline = {
      device = true
    }
  },
  dev_log = {
    enabled = true,
    open_cmd = "split __FLUTTER_DEV_LOG__ | resize 15", -- command to use to open the log buffer
  },
  lsp = {
    color = {
      enabled = true,
    },
    on_attach = function(client, bufnr)
      handlers.on_attach(client, bufnr);

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<Leader>tl", "<cmd>lua _DART_TOGGLE_LOG() <CR>")
      vim.keymap.set("n", "<Leader>fc", ":FlutterLogClear<CR>", opts)
      vim.keymap.set("n", "<Leader>fr", ":FlutterReload<CR>", opts)
      vim.keymap.set("n", "<Leader>fR", ":FlutterRestart<CR>", opts)

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.dart" },
        callback = function()
          vim.lsp.buf.format({ timeout_ms = 10000 })
        end
      })
    end,
    capabilities = handlers.capabilities,
    settings = {
      renameFilesWithClasses = "prompt",
      updateImportsOnRename = true,
      completeFunctionCalls = true,
    },
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
    register_configurations = function(paths)
      local ok2, dap = pcall(require, "dap")
      if not ok2 then
        return
      end

      dap.adapters.dart = {
        type = "executable",
        command = "flutter",
        args = { "debug_adapter" },
      }

      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch Flutter App",
          dartSdkPath = paths.dart_sdk,                     -- ensure this is correct
          flutterSdkPath = paths.flutter_sdk,               -- ensure this is correct
          program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
          cwd = "${workspaceFolder}",
        },
      }

      require("dap.ext.vscode").load_launchjs()
    end,
  },
}
