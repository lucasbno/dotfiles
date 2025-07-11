local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map(
  "n",
  "<C-f>",
  "<cmd> Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top previewer=false <CR>"
)

map("n", "<leader>rw", ":%s/\\<<C-r><C-w>\\>//gc<left><left><left>", { desc = "replace word under cursor" })
map("v", "<leader>rw", 'y :%s/<c-r>"//gc<left><left><left>', { desc = "replace word under cursor" })
