local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  print("Nvim-autopairs could not be initialized")
  return
end

autopairs.setup {
  check_ts = true,
  disable_filetype = { "TelescopePrompt" , "vim" },
}

local ok2, cmp = pcall(require, "cmp")
local ok3, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not ok2 or not ok3 then
  print("Cmp-autopairs could not be initialized")
  return
end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

