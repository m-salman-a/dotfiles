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
    preview = {
      mime_hook = function(filepath, bufnr, opts)
        local is_image = function(filepath)
          local image_extensions = {'png','jpg'}   -- Supported image formats
          local split_path = vim.split(filepath:lower(), '.', {plain=true})
          local extension = split_path[#split_path]
          return vim.tbl_contains(image_extensions, extension)
        end
        if is_image(filepath) then
          local term = vim.api.nvim_open_term(bufnr, {})
          local function send_output(_, data, _ )
            for _, d in ipairs(data) do
              vim.api.nvim_chan_send(term, d..'\r\n')
            end
          end
          vim.fn.jobstart(
            {
              'kitten icat', filepath  -- Terminal image viewer command
            },
            {on_stdout=send_output, stdout_buffered=true, pty=true})
        else
          require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
        end
      end
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
    },
  }
}

