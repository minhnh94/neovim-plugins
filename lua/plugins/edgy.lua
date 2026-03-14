return {
  -- 1. Configure Edgy to manage the stacking
  {
    "folke/edgy.nvim",
    optional = true,
    init = function()
      local group = vim.api.nvim_create_augroup("edgy_aerial_auto_open", { clear = true })

      local function open_aerial_in_edgy()
        if vim.v.exiting ~= vim.NIL then
          return
        end

        vim.schedule(function()
          if vim.v.exiting ~= vim.NIL then
            return
          end

          local ok, edgy = pcall(require, "edgy")
          if ok then
            edgy.open("left")
          end
        end)
      end

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "VeryLazy",
        once = true,
        callback = open_aerial_in_edgy,
      })

      vim.api.nvim_create_autocmd("WinClosed", {
        group = group,
        callback = open_aerial_in_edgy,
      })
    end,
    opts = function(_, opts)
      -- Ensure the left sidebar list exists
      opts.left = opts.left or {}

      -- Add Aerial to the left stack
      table.insert(opts.left, {
        title = "Aerial",
        ft = "aerial",
        pinned = true,
        open = function()
          require("aerial").open({ focus = false, direction = "left" })
        end,
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
