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
      opts.left = opts.left or {}

      -- Add Snacks Explorer to the left stack (top 60%)
      -- The explorer uses snacks layout: a root split (ft = "snacks_layout_box")
      -- with floating input+list windows relative to it.
      table.insert(opts.left, {
        title = "Explorer",
        ft = "snacks_layout_box",
        pinned = true,
        open = function()
          Snacks.explorer({ focus = false })
        end,
        filter = function(buf, win)
          for _, picker in ipairs(Snacks.picker.get({ source = "explorer" })) do
            if picker.layout and picker.layout.root and picker.layout.root.win == win then
              return true
            end
          end
          return false
        end,
        size = { height = 0.6 },
      })

      -- Add Aerial to the left stack (bottom 40%)
      table.insert(opts.left, {
        title = "Aerial",
        ft = "aerial",
        pinned = true,
        open = function()
          require("aerial").open({ focus = false, direction = "left" })
        end,
        size = { height = 0.4 },
      })
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
      attach_mode = "global",
      show_guides = true,
    },
  },

  -- 3. Enable snacks explorer
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = true },
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
        desc = "Toggle Sidebar Stack (Explorer + Aerial)",
      },
    },
  },
}
