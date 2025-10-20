return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	build = "cd app && npm install",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },
	},
	init = function()
		-- use system default browser
		vim.g.mkdp_browser = ""
		-- optional: pick a specific browser
		-- vim.g.mkdp_browser = "Google Chrome"
		-- vim.g.mkdp_browser = "Firefox"
		vim.g.mkdp_auto_close = 1 -- close tab when preview stops
	end,
}
