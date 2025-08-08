-- Entry point: load main config

-- Set leader early (Caps Lock as leader)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core config (options, keymaps, autocmds)
require("config")

-- Install lazy.nvim if it's missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugins defined in lua/plugins/*.lua
require("lazy").setup({
  { import = "plugins" },
}, {
  ui = { border = "rounded" },
})

