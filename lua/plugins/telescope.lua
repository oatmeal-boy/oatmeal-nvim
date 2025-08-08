return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = "move_selection_previous",
						["<C-j>"] = "move_selection_next",
					},
				},
			},
		})

		-- Keymaps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true, desc = "" }

		map("n", "<leader><space>", builtin.buffers, { desc = "Find Buffers" })
		map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		map("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
		map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
		map("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
		map("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })
		map("n", "<leader>km", builtin.keymaps, { desc = "Find Keymaps" })
	end,
}
