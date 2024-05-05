function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

  --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#9ccfd8", bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#f6c177", bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#b4637a", bg = "none" })
end

ColorMyPencils()
