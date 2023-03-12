local ok, tokyonight = pcall(require, "tokyonight")
if ok then
  tokyonight.setup {
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
end

local ok2, catppuccin = pcall(require, "catppuccin")
if ok2 then
  catppuccin.setup {
    custom_highlights = function (colors)
      return {
        ["@type.qualifier"] = { fg = colors.mauve, style = { "italic" } },
        ["@attribute"] = { fg = colors.sky }
      }
    end,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      telescope = true,
      native_lsp = {
        enable = true
      },
      mason = true
    }
  }
end

local colorscheme = "catppuccin-frappe"

local ok = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
  print(string.format("The colorscheme (%s) could not be initialized", colorscheme))
end
