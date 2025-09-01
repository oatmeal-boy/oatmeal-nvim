return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			jsonc = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			lua = { "stylua" },
			sh = { "shfmt" },
			terraform = { "terraform_fmt" },
			html = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			scss = { "prettierd", "prettier" },
			bash = { "shfmt" },
			dockerfile = { "dockfmt" },
			["*"] = { "lsp" }, -- fallback to lsp
		},
		format_on_save = function(bufnr)
			local filepath = vim.api.nvim_buf_get_name(bufnr)
			-- if path contains templates/, don't format (for Helm)
			if filepath:match("templates/") then
				return
			end
			return { lsp_fallback = true, timeout_ms = 2000 }
		end,
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ lsp_fallback = true, timeout_ms = 2000 })
		end, { desc = "Format buffer" })
	end,
}
