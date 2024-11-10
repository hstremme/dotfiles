return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() 
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add to list" })
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon open list quick menu" })

      -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon select first" })
      -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon select second" })
      -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon select third" })
      -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon select fourth" })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

      -- Telescope Display
      -- local conf = require("telescope.config").values
      -- vim.keymap.set("n", "<C-e>", 
      --   function() 
      --     local file_paths = {}
      --     for _, item in ipairs(harpoon:list().items) do
      --         table.insert(file_paths, item.value)
      --     end

      --     require("telescope.pickers").new({}, {
      --         prompt_title = "Harpoon",
      --         finder = require("telescope.finders").new_table({
      --             results = file_paths,
      --         }),
      --         previewer = conf.file_previewer({}),
      --         sorter = conf.generic_sorter({}),
      --     }):find()
      --   end, 
      --   { desc = "Harpoon open list quick menu (Telescope)" })
    end,
}
