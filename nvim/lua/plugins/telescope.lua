return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.8',
  init = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope find keymaps' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope find help tags' })
  end,
  opts = {
    pickers = {
      find_files = {
        hidden = true
      } 
    }
  }
}

