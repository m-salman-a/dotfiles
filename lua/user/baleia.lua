local ok, baleia = pcall(require, "baleia")
if not ok then
  print("Baleia could not be initialized")
  return
end

local bal = baleia.setup()

vim.api.nvim_create_user_command(
  "BaleiaColorize",
  function(_)
    bal.once(vim.api.nvim_get_current_buf())
  end,
  {}
)

