-- Format on save with null-ls only
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({
			async = false,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end,
})
