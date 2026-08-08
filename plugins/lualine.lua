return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "", right = "" }
    opts.sections.lualine_b = {}
    opts.sections.lualine_x = {
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
          added = { fg = "#50fa7b", gui = "bold" }, -- Pops bright green
          modified = { fg = "#f1fa8c" }, -- Pops bright yellow
          removed = { fg = "#ff5555" }, -- Pops bright red
        },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        diagnostics_color = {
          error = { fg = "#ff5555", gui = "bold" },
          warn = { fg = "#ffb86c" },
        },
      },
    }

    opts.sections.lualine_y = { "filetype" }
    opts.sections.lualine_z = { "location" }
  end,
}
