
local ok, formatter = pcall(require, "formatter")
if not ok then
  print("Formatter could not be initialized")
  return
end

formatter.setup {
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    dart = {
      require("formatter.filetypes.dart").dartformat,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.dart,*.lua FormatWrite
augroup END
]])
