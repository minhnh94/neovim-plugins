return {
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup({
        show = true,
        hide_if_all_visible = false,
        marks = {
          Search = { text = { "-", "=" } },
          Error = { text = { "-", "=" } },
          Warn = { text = { "-", "=" } },
          Info = { text = { "-", "=" } },
          Hint = { text = { "-", "=" } },
        },
        excluded_filetypes = {
          "prompt",
          "TelescopePrompt",
          "noice",
          "lazy",
          "mason",
          "neo-tree",
        },
      })

      -- optional: search marks integration (requires hlslens plugin)
      -- pcall(require("scrollbar.handlers.search").setup)
    end,
  },
}
