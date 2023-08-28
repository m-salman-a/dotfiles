local ok, lualine = pcall(require, "lualine")
if not ok then
  print("Lualine could not be initialized")
  return
end

lualine.setup {
  options = {
    disabled_filetypes = { "NvimTree" },
    theme = "catppuccin"
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

          return str
        end
      },
      { 'diagnostics' },
    }
  },
}
