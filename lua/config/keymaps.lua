vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable arrow keys
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

-- Use system clipboard for all yanks/deletes/pastes
vim.opt.clipboard = "unnamedplus"
-- reselect after copy with y
vim.keymap.set("v", "y", "ygv", { noremap = true, silent = true, desc = "Yank and reselect" })
