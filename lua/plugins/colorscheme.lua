return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,

      on_highlights = function(hl, c)
        -- Core editor
        hl.Normal = { bg = "none" }
        hl.NormalNC = { bg = "none" }
        hl.SignColumn = { bg = "none" }
        hl.EndOfBuffer = { bg = "none" }
        hl.LineNr = { bg = "none" }
        hl.CursorLineNr = { bg = "none" }
        hl.FoldColumn = { bg = "none" }

        -- Floats / popups
        hl.NormalFloat = { bg = "none" }
        hl.FloatBorder = { bg = "none" }
        hl.Pmenu = { bg = "none" }
        hl.PmenuSel = { bg = c.bg_highlight, fg = c.fg }
        -- Neo-tree
        hl.NeoTreeNormal = { bg = "none" }
        hl.NeoTreeNormalNC = { bg = "none" }
        hl.NeoTreeEndOfBuffer = { bg = "none" }
        hl.NeoTreeWinSeparator = { bg = "none" }

        -- Telescope
        hl.TelescopeNormal = { bg = "none" }
        hl.TelescopeBorder = { bg = "none" }
        hl.TelescopePromptNormal = { bg = "none" }
        hl.TelescopePromptBorder = { bg = "none" }
        hl.TelescopeResultsNormal = { bg = "none" }
        hl.TelescopeResultsBorder = { bg = "none" }
        hl.TelescopePreviewNormal = { bg = "none" }
        hl.TelescopePreviewBorder = { bg = "none" }
        -- Lazy / Mason / WhichKey / Trouble / Noice
        hl.LazyNormal = { bg = "none" }
        hl.MasonNormal = { bg = "none" }
        hl.WhichKeyFloat = { bg = "none" }
        hl.TroubleNormal = { bg = "none" }
        hl.NoiceCmdlinePopup = { bg = "none" }
        hl.NoiceCmdlinePopupBorder = { bg = "none" }

        -- Optional: vertical separators
        hl.WinSeparator = { bg = "none", fg = c.border_highlight }
      end,
    },
  },
}
