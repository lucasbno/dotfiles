return {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'moll/vim-bbye',
    {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    },
    {
    "folke/neodev.nvim",
      lazy = true,
    },
}
