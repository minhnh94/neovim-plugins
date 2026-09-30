local mise = vim.fn.exepath("mise")
if mise == "" then
  mise = "mise"
end

return {
  { "tpope/vim-rails" },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    opts = {
      ensure_installed = { "embedded_template" },
      indent = { disable = { "ruby", "yaml" } },
      endwise = { enable = true },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { mise, "exec", "ruby", "--", "ruby-lsp" },
        },
        rubocop = {
          mason = false,
          cmd = { mise, "exec", "ruby", "--", "bundle", "exec", "rubocop", "--lsp" },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      local dap = require("dap")
      dap.configurations.ruby = dap.configurations.ruby or {}

      local function add_rails_config(name, command_args)
        for _, config in ipairs(dap.configurations.ruby) do
          if config.name == name then
            return
          end
        end
        table.insert(dap.configurations.ruby, {
          name = name,
          type = "ruby",
          request = "attach",
          command = mise,
          args = vim.list_extend({ "exec", "ruby", "--" }, command_args),
          options = { source_filetype = "ruby" },
          error_on_failure = true,
          localfs = true,
          random_port = true,
          waiting = 1000,
        })
      end

      add_rails_config("Yappie Rails: server (mise)", { "bundle", "exec", "rails", "server" })
      add_rails_config("Yappie Rails: bin/dev (mise)", { "bin/dev" })
      return opts
    end,
  },
}
