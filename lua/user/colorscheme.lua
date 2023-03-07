require("tokyonight").setup {
  on_highlights = function (highlights, colors)
    highlights["@keyword"] = {
      fg = colors.magenta,
    }
    highlights["@keyword.return"] = {
      fg = colors.magenta,
    }
    highlights["@type.qualifier"] = {
      fg = colors.magenta,
      italic = true,
    }
    highlights["@constant.builtin"] = {
      fg = "#ff9e64"
    }
    highlights["@parameter"] = {}
  end
}

local colorscheme = "tokyonight-storm"

local ok = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
  print(string.format("The colorscheme (%s) could not be initialized", colorscheme))
end
