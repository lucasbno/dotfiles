lvim.builtin.telescope.pickers.find_files.previewer = nil

lvim.builtin.telescope = {
    active = true,
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
    },
    pickers = {
        find_files = {
            layout_config = { width = 0.80, height = 0.80, preview_width = 0.60, prompt_position = "top" },
            previewer = nil
        }
    }
}

lvim.builtin.telescope.defaults.prompt_prefix = "  "
lvim.builtin.telescope.defaults.selection_caret = "❯ "

lvim.builtin.telescope.defaults.borderchars = {
    prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
    results = { " ", " ", " ", " ", " ", " ", " ", " " },
    preview = { " ", " ", " ", " ", " ", " ", " ", " " },
}

