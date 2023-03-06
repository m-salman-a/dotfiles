local ok, telescope = pcall(require, "telescope")
if not ok then
  print("Telescope could not be initialized")
  return
end

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

telescope.load_extension("fzf")

telescope.load_extension("flutter")
