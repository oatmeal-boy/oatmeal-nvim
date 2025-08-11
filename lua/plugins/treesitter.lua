return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"python",
					"terraform",
					"dockerfile",
					"ini",
					"go",
					"lua",
					"yaml",
					"json",
					"vim",
					"groovy",
					"typescript",
					"tsx",
					"javascript",
					"html",
					"css",
					"markdown",
					"markdown_inline",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
