vim.g.mapleader = " "

-- Back to browse
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = 'Back to browse' })

-- Search highlight reset (No Highlight)
vim.keymap.set("n", "<leader>nh", ":noh<CR>", { desc = '[n]o [h]ighlight' })
