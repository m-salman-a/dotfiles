local ok, telescope = pcall(require, "telescope")
if not ok then
  print("Telescope could not be initialized")
  return
end

local actions = require("telescope.actions")

telescope.load_extension("fzf")

telescope.load_extension("flutter")

telescope.setup {
  pickers = {
    buffers = {
      mappings = {
        n = {
          ["q"] = actions.close,
          ["d"] = actions.delete_buffer + actions.move_to_top
        }
      }
    }
  },
  defaults = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "ignore_case",      -- or "ignore_case" or "respect_case"
      },
    }
  }
}
