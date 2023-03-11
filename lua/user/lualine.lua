local ok, lualine = pcall(require, "lualine")
if not ok then
  print("Lualine could not be initialized")
  return
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

lualine.setup {
  options = {
    disabled_filetypes = { "NvimTree" }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      {
        'b:gitsigns_head',
        fmt = function(str)
          function string.startsWith(start)
            return string.sub(str, 1, string.len(start)) == start
          end

          -- Custom config for Work.
          local substr = string.match(str, 'TOCOPROD[-]%d+')
          if substr ~= nil then
            return substr
          end

          return str:sub(1, 30)
        end
      },
      {
        'diff',
        source = diff_source
      },
      { 'diagnostics' },
    }
  },
}
