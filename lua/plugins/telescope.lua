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

		map("n", "<leader><space>", builtin.buffers, { desc = "Find Buffers" })

		-- Find files: special logic for Oil
		map("n", "<leader>ff", function()
			local dir
			local ok, oil = pcall(require, "oil")
			if ok then
				dir = oil.get_current_dir()
			end
			dir = dir or vim.fn.expand("%:p:h")
			builtin.find_files({ cwd = dir })
		end, { desc = "Find Files (Oil aware)" })

		map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		map("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
		map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
		map("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
		map("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })
		map("n", "<leader>km", builtin.keymaps, { desc = "Find Keymaps" })
	end,
}
