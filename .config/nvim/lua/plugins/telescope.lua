return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    keys = {
      { "<leader><space>", "<cmd> Telescope buffers initial_mode=normal <CR>", desc = "Find buffers" },
      {
        "<leader>fw",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args({
            auto_quoting = false,
          })
        end,
        desc = "Grep (root dir)",
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = "move_selection_previous",
            ["<C-j>"] = "move_selection_next",
          },
        },
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        --TODO: make borders better
        borderchars = {
          prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
          results = { " ", " ", " ", " ", " ", " ", " ", " " },
          preview = { " ", " ", " ", " ", " ", " ", " ", " " },
        },
      },
    },
  },
}
