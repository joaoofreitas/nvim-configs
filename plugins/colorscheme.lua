return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup({
      transparent_background = false,
      terminal_colors = true,
      devicons = true, -- requires nvim-web-devicons
      filter = "spectrum", -- options: classic, machine, octagon, ristretto, spectrum
    })
    vim.cmd([[colorscheme monokai-pro]])
  end,
}
