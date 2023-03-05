local ok, cmp = pcall(require, "cmp")
if not ok then
  print("Completion could not be initialized")
  return
end

local ok2, snip = pcall(require, "luasnip")
if not ok2 then
  print("Snipping engine could not be initialized")
  return
end

cmp.setup {
  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
  }
}

