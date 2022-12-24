lvim.leader = "space"
M = {}
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-n>"] = ":ToggleTerm<cr>"
lvim.keys.normal_mode["<C-f>"] = "<cmd> Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top previewer=false <CR>"
lvim.keys.normal_mode["<C-p>"] = "<cmd> Telescope find_files <CR>"

lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<space>r"] = ":%s/\\<<C-r><C-w>\\>//g<left><left>"
lvim.keys.visual_mode["<space>r"] = ":%s/\\<<C-r><C-w>\\>//g<left><left>"

lvim.builtin.which_key.mappings["f"] = {
  name = "Telescope",
  f = { "<cmd> Telescope find_files <CR>", "Find files" },
  w = { "<cmd> Telescope live_grep <CR>", "Search codebase" },
  d = { "<cmd> Telescope diagnostics <CR>", "Search diagnostics" }
}


--LSP
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Goo to Definiton" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Goo to Definiton" }
lvim.lsp.buffer_mappings.normal_mode["gi"] = { "<cmd>Telescope lsp_implementations<cr>", "Goo to Definiton" }

keymap("v", "p", '"_dP', opts)
