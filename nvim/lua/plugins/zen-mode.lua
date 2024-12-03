return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
    backdrop = 1,
    width = .8,
    height = .9,
    options = {
      number = false,
      relativenumber = false,
    }
  },
  plugins = {
    tmux = { enabled = true },
    gitsigns = { enabled = true },
    alacritty = {
      enabled = true,
      font = "12"
    }
  },
  on_open = function()
    vim.cmd("LspStop")
  end,
  on_close = function()
    vim.cmd("LspStart")
  end
  }
}
