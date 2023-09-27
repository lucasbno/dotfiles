lvim.plugins = {
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	"catppuccin/nvim",
	"kylechui/nvim-surround",
	"andweeb/presence.nvim",
	"simrat39/rust-tools.nvim",
	{
		{
			"saecki/crates.nvim",
			version = "v0.3.0",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("crates").setup({
					null_ls = {
						enabled = true,
						name = "crates.nvim",
					},
					popup = {
						border = "rounded",
					},
				})
			end,
		},
	},
}
