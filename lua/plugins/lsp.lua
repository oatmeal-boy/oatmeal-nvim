return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Disable formatting from LSP (we use conform.nvim for formatting)
			local on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end

			-- LSP servers configuration
			local servers = {
				bashls = {},
				pyright = {},
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							analyses = {
								unusedparams = true,
								unusedvariable = true,
								nilness = true,
								shadow = true,
							},
						},
					},
				},
				terraformls = {},
				dockerls = {},
				helm_ls = {},
				groovyls = {},
				yamlls = {
					settings = {
						yaml = {
							schemas = {
								kubernetes = "k8s/*.yaml", -- restricted to the k8s folder
							},
						},
					},
				},
				-- TypeScript / JavaScript
				ts_ls = {
					settings = {
						typescript = { format = { enable = false } }, -- formatting off (Conform/Prettier will handle it)
						javascript = { format = { enable = false } },
						-- optional: useful preferences
						preferences = {
							importModuleSpecifier = "non-relative",
							quoteStyle = "auto",
						},
					},
				},
				-- Optional: uncomment if you want JSON/HTML/CSS LSP support
				-- jsonls = {},
				-- html = {},
				-- cssls = {},
			}

			for name, opts in pairs(servers) do
				opts.on_attach = on_attach
				lspconfig[name].setup(opts)
			end

			-- ESLint LSP: diagnostics + auto-fix on save (NO formatting)
			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					-- Keep formatting disabled (Conform is the only formatter)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false

					-- Auto-apply ESLint fixes before save (Prettier will still run after)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.execute_command({
								command = "eslint.applyAllFixes",
								arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
							})
						end,
					})
				end,
				settings = {
					-- Recommended for monorepos
					workingDirectory = { mode = "auto" },
				},
			})
		end,
	},
}
