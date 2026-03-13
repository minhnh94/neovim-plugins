return {
  -- 1. Configure Edgy to manage the stacking
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      -- Ensure the left sidebar list exists
      opts.left = opts.left or {}

      -- Add Aerial to the left stack
      table.insert(opts.left, {
        title = "Aerial",
        ft = "aerial",
        pinned = true,
        open = "AerialOpen",
        size = { height = 0.4 }, -- Aerial takes bottom 40%
      })

      -- Adjust Neo-tree to take the remaining space
      for _, pos in ipairs(opts.left) do
        if pos.ft == "neo-tree" then
          pos.size = { height = 0.6 } -- Neo-tree takes top 60%
        end
      end
    end,
  },

  -- 2. Tweak Aerial settings for a cleaner "docked" look
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        default_direction = "left",
        placement = "edge",
      },
      attach_mode = "global", -- Updates based on the current buffer
      show_guides = true,
    },
  },

  -- 3. Ensure Neo-tree plays nice with the split
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "left",
        width = 30,
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>B", group = "Sidebar" },
      },
    },
  },

  {
    "folke/edgy.nvim",
    keys = {
      {
        "<leader>BB",
        function()
          require("edgy").toggle("left")
        end,
        desc = "Toggle Sidebar Stack (Neo-tree + Aerial)",
      },
    },
  },
}
