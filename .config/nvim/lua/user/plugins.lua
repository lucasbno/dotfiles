local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
          -- load the colorscheme here
          require("plugins.catppuccin")
          vim.cmd([[colorscheme catppuccin]])
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
          require("plugins.nvim-tree")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
          require("plugins.telescope")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
          require('plugins.lualine')
        end,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    {
        'akinsho/bufferline.nvim',
        config = function()
          require("plugins.bufferline")
        end,
        requires = 'nvim-tree/nvim-web-devicons'
    },

    {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
          require("plugins.alpha")
        end,
    },

    --Utils
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'moll/vim-bbye'
})
