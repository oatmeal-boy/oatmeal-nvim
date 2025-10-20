return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	keys = {
		{ "<leader>zm", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
	},
	opts = {
		window = { width = 80 },
		on_open = function()
			-- soft wrap settings
			vim.opt_local.wrap = true
			vim.opt_local.linebreak = true
			vim.opt_local.breakindent = true
			vim.opt_local.textwidth = 0
			vim.opt_local.formatoptions:remove("t")

			-- visual-line remaps (only in ZenMode buffer)
			vim.keymap.set("n", "j", "gj", { buffer = true })
			vim.keymap.set("n", "k", "gk", { buffer = true })
			vim.keymap.set("n", "0", "g0", { buffer = true })
			vim.keymap.set("n", "$", "g$", { buffer = true })
		end,
		on_close = function()
			-- optional: nothing needed, buffer-local maps vanish with the buffer
			-- but you could reset options here if you want
		end,
	},
}
