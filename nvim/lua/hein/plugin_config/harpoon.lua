local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = 'Harpoon Append' })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon Menu' })

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = 'Harpoon select 1' })
vim.keymap.set("n", "<C-a>", function() harpoon:list():select(2) end, { desc = 'Harpoon select 2' })
vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end, { desc = 'Harpoon select 4' })
