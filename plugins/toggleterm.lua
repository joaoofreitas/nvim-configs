return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      -- Setting open_mapping to nil or removing it prevents
      -- conflicts with your custom leader keymap.
      open_mapping = [[<leader>.]],
      direction = "float",
      shade_terminals = true,
      float_opts = {
        border = "curved",
      },
    },
    keys = {
      -- This sets <leader>. to toggle the terminal
      { "<leader>.", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    },
  },
}
