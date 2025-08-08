return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Terraform
				null_ls.builtins.formatting.terraform_fmt,

				-- Web
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"html",
						"css",
						"json",
						"yaml",
						"markdown",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
					},
				}),

				-- Go
				null_ls.builtins.formatting.gofmt,
			},
		})
	end,
}
