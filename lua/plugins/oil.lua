return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			view_options = { show_hidden = true },
			keymaps = {
				["t"] = {
					callback = function()
						local oil = require("oil")
						local entry = oil.get_cursor_entry()
						if entry and entry.type == "file" then
							vim.cmd("tabnew " .. oil.get_current_dir() .. entry.name)
						end
					end,
					desc = "Open file in new tab",
				},
			},
		})
		vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Oil" })
	end,
}
