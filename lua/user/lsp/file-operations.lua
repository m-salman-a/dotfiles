local ok, lsp_file_operations = pcall(require, "lsp-file-operations")
if not ok then
  print("Lsp-file-operations could not be initialized")
  return
end

lsp_file_operations.setup()
