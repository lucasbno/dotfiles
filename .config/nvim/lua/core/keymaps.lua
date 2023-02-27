local group = vim.api.nvim_create_augroup("mapping_cmds", { clear = true })
local keymap = vim.keymap.set
local opts = { silent = true }

-- Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
------------------- Normal --------------------------
-- Basic clipboard interaction
vim.keymap.set({ "n", "x" }, "cv", '"+p')
vim.keymap.set({ "n", "x" }, "cp", '"+y')

-- Delete text
vim.keymap.set({ "n", "x" }, "x", '"_x')

-- Save buffer
keymap("n", "<C-s>", "<cmd>write<cr>")

-- Close buffer
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>w", "<C-w>w", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
keymap("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)

------------------- Insert --------------------------

-- Press jk fast to exit insert mode
keymap("i", "jj", "<ESC>", opts)

-- Save file
keymap("i", "<C-s>", "<Esc>:write<cr>")

-- Move line up/down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi") -- move line up(n)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi") -- move line down(n)

------------------- Visual --------------------------

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

keymap("v", "p", '"_dP', opts)

------------------- Plugins --------------------------

-- Nvim tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader> ", ":Telescope buffers initial_mode=normal<CR>", opts)
keymap("n", "<C-f>", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending previewer=false <CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Lsp stuff
keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<leader>ld", ":Telescope diagnostics bufnr=0 previewer=false initial_mode=normal<CR>", opts)
