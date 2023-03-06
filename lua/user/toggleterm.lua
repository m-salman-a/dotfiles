local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  print("Toggleterm could not be initialized")
  return
end

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new(
  {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
  }
)

function _lazygit_toggle()
  lazygit:toggle()
end

toggleterm.setup {
  float_opts = {
    border = "rounded",
  }
}

vim.keymap.set("n", "<Leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

