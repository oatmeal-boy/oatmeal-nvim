--- Conform plugin format-on-save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({ bufnr = args.buf, lsp_fallback = true, timeout_ms = 2000 })
	end,
})
