vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8

-- Set indentation specifically for PHP files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4
    end,
})
