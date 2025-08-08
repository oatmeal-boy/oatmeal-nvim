-- Autopairs plugin (auto-close commas, paranthesis etc)

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
}
