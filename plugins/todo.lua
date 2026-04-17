return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    event = "VimEnter",
    opts = {},
    keys = {
      -- This opens a list of all TODOs in a panel at the bottom
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },

      -- This filters the list to only show TODOs for the current file
      {
        "<leader>xT",
        "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
        desc = "Todo Filtered (Trouble)",
      },

      -- Navigation
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next Todo",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous Todo",
      },
    },
  },
}
