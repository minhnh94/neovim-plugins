return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,

      custom_highlights = function(colors)
        return {
          -- Core editor
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          SignColumn = { bg = "none" },
          EndOfBuffer = { bg = "none" },
          LineNr = { bg = "none", fg = colors.overlay1 },
          LineNrAbove = { bg = "none", fg = colors.overlay1 },
          LineNrBelow = { bg = "none", fg = colors.overlay1 },
          CursorLineNr = { bg = "none", fg = colors.peach, bold = true },
          FoldColumn = { bg = "none" },

          -- Current line / cursor visibility
          CursorLine = { bg = "#1e1e2e" },
          CursorColumn = { bg = "#1e1e2e" },
          Cursor = { fg = colors.base, bg = colors.text },
          TermCursor = { fg = colors.base, bg = colors.text },

          -- Floats / menus
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none", fg = colors.surface2 },
          Pmenu = { bg = "none" },
          PmenuSel = { bg = colors.surface0, fg = colors.text },

          -- Neo-tree
          NeoTreeNormal = { bg = "none" },
          NeoTreeNormalNC = { bg = "none" },
          NeoTreeEndOfBuffer = { bg = "none" },
          NeoTreeWinSeparator = { bg = "none", fg = colors.surface1 },

          -- Telescope
          TelescopeNormal = { bg = "none" },
          TelescopeBorder = { bg = "none", fg = colors.surface1 },
          TelescopePromptNormal = { bg = "none" },
          TelescopePromptBorder = { bg = "none", fg = colors.surface1 },
          TelescopeResultsNormal = { bg = "none" },
          TelescopeResultsBorder = { bg = "none", fg = colors.surface1 },
          TelescopePreviewNormal = { bg = "none" },
          TelescopePreviewBorder = { bg = "none", fg = colors.surface1 },

          -- Lazy / Mason / WhichKey / Trouble / Noice
          LazyNormal = { bg = "none" },
          MasonNormal = { bg = "none" },
          WhichKeyFloat = { bg = "none" },
          TroubleNormal = { bg = "none" },
          NoiceCmdlinePopup = { bg = "none" },
          NoiceCmdlinePopupBorder = { bg = "none", fg = colors.surface1 },

          -- Separators
          WinSeparator = { bg = "none", fg = colors.surface1 },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
