return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = {
        bashls = {},
        pyright = {},
        gopls = {},
        terraformls = {},
        dockerls = {},
        helm_ls = {},
        groovyls = {},
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                kubernetes = "*.yaml",
              },
            },
          },
        },
      }

      for name, opts in pairs(servers) do
        lspconfig[name].setup(opts)
      end
    end,
  },
}
