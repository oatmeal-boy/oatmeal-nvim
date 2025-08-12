-- Set leader early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable newtrw (nvim file explorer) so we can use oil.vim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
