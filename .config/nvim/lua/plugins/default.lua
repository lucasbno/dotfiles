return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
    },
  },
  { "zbirenbaum/copilot-cmp", enabled = false },
}
