local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags ,{ desc = '[f]ind [h]elp' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps ,{ desc = '[f]ind [k]ey' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep ,{ desc = '[f]ind [g]rep' })
