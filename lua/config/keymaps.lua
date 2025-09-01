-- Disable arrow keys
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

-- reselect after copy with y
vim.keymap.set("v", "y", "ygv", { noremap = true, silent = true, desc = "Yank and reselect" })

-- Go to next / previous buffer
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })

-- Go to specific buffer number
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", { silent = true })
end

vim.keymap.set("n", "<Leader>q", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { silent = true })
