return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash", "python", "terraform", "dockerfile", "ini", "go", "lua",
          "yaml", "json", "vim", "groovy"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
