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

local compare = cmp.config.compare

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
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
  }),
  sorting = {
    comparators = {
      -- compare.score_offset, -- not good at all
      compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
      -- compare.locality,
      -- compare.recently_used,
      -- compare.offset,
      -- compare.order,
      -- compare.scopes, -- what?
      -- compare.sort_text,
      -- compare.exact,
      -- compare.kind,
      -- compare.length, -- useless ,
    }
  }
}
