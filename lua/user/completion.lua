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

local cmp_kinds = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = function(_, vim_item)
      vim_item.kind = cmp_kinds[vim_item.kind] or ""
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
	cmp.confirm()
      else
	fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
      end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
	cmp.select_next_item()
	-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
	-- they way you will only jump inside the snippet region
      elseif snip.expand_or_jumpable() then
	snip.expand_or_jump()
      elseif has_words_before() then
	cmp.complete()
      else
	fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
	cmp.select_prev_item()
      elseif snip.jumpable(-1) then
	snip.jump(-1)
      else
	fallback()
      end
    end, { "i", "s" }),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
  })
}

