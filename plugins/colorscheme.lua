return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = false,
        styles = {
          comments = "italic",
          keywords = "bold",
          functions = "italic,bold",
          variables = "italic",
          conditionals = "bold",
          constants = "bold",
          numbers = "bold",
          operators = "bold",
          types = "italic,bold",
        },
      },
    })
    vim.cmd([[colorscheme carbonfox]])
  end,
}
