return {
  -- 1. Smooth Scrolling (The "Essential" Smoothness)
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        -- Reduce speed for a more "natural" glide
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor during scroll for cleaner look
        stop_eof = true, -- Stop at end of file
        respect_scrolloff = false, -- Better feel when reaching top/bottom
        cursor_scrolls_alone = true, -- The cursor moves with the scroll
        easing_function = "quadratic", -- "quadratic" is smoother/less jerky than "linear"
      })
    end,
  },

  -- 2. Subtle Smear Cursor (The "Modern" Touch)
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      -- These settings make the "tail" very short and fast
      -- so it feels like a subtle glide rather than a long ghost trail.
      stiffness = 0.8, -- Higher = faster, snappier movement
      trailing_stiffness = 0.5, -- Higher = shorter tail
      distance_stop_animating = 0.5, -- Stops sooner to avoid "wobble"
      hide_target_hack = true, -- Smoother look in some terminals
    },
  },
}
