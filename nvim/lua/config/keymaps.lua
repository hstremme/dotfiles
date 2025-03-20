vim.g.mapleader = " "

-- Back to browse
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = 'Back to browse' })

-- Search highlight reset (No Highlight)
vim.keymap.set("n", "<leader>nh", ":noh<CR>", { desc = '[n]o [h]ighlight' })

-- Diagnostics Iteration
vim.keymap.set("n", "<leader>dn", ":lua vim.diagnostic.goto_next() <CR>", { desc = '[n]ext [d]iagnostic' })
vim.keymap.set("n", "<leader>dp", ":lua vim.diagnostic.goto_prev() <CR>", { desc = '[p]revious [d]iagnostic' })
