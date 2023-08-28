local ok, tokyonight = pcall(require, "tokyonight")
if ok then
  tokyonight.setup {}
end

local ok2, catppuccin = pcall(require, "catppuccin")
if ok2 then
  catppuccin.setup({
    flavour = "frappe",
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      telescope = {
        enabled = true
      },
      native_lsp = {
        enable = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      dap = {
        enabled = true,
      },
      mason = true
    }
  })
end

local colorscheme = "catppuccin"

local ok3 = pcall(vim.cmd.colorscheme, colorscheme)
if not ok3 then
  print(string.format("The colorscheme (%s) could not be initialized", colorscheme))
end
