return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		npairs.setup({
			fast_wrap = {},
			map_c_w = true,
		})

		-- Jump out cu Ctrl-l pentru orice caracter de închidere
		local closing_chars = { [")"] = true, ["]"] = true, ["}"] = true, ['"'] = true, ["'"] = true, ["`"] = true }

		vim.keymap.set("i", "<C-l>", function()
			local col = vim.fn.col(".")
			local line = vim.fn.getline(".")
			local next_char = line:sub(col, col)

			if closing_chars[next_char] then
				return "<Right>"
			else
				return "<C-l>"
			end
		end, { expr = true, noremap = true })
	end,
}
