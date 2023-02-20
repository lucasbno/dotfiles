return {
    "nvim-telescope/telescope.nvim",
    config = function()
      local status_ok, telescope = pcall(require, "telescope")
      if not status_ok then
        return
      end

      local actions = require "telescope.actions"

      telescope.setup {
          defaults = {
              files_ignore_patterns = { "node_modules" },
              layout_strategy = "horizontal",
              sorting_strategy = "ascending",
              prompt_position = "top",
              layout_config = {
                  horizontal = {
                      prompt_position = "top",
                      preview_width = 0.55,
                      results_width = 0.8,
                  },
                  vertical = {
                      mirror = false,
                  },
                  width = 0.87,
                  height = 0.80,
                  preview_cutoff = 120,
              },
              borderchars = {
                  prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
                  results = { " ", " ", " ", " ", " ", " ", " ", " " },
                  preview = { " ", " ", " ", " ", " ", " ", " ", " " },
              },
              prompt_prefix = " ",
              selection_caret = "ﰲ ",
              path_display = { "truncate" },
              file_ignore_patterns = { ".git/", "node_modules" },
              mappings = {
                  i = {
                      ["<Down>"] = actions.cycle_history_next,
                      ["<Up>"] = actions.cycle_history_prev,
                      ["<C-j>"] = actions.move_selection_next,
                      ["<C-k>"] = actions.move_selection_previous,
                  },
              },
          },
          pickers = {
              find_files = {
                  layout_config = { width = 0.80, height = 0.80, preview_width = 0.60, prompt_position = "top" },
                  previewer = nil
              },
          },
      }
    end,
}
