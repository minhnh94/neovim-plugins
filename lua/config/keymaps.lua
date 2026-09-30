-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function root_terminal()
  Snacks.terminal.focus(nil, {
    cwd = LazyVim.root(),
    win = {
      height = function(win)
        return math.max(1, math.floor(win:parent_size().height * 0.4) - 10)
      end,
    },
  })
end

vim.keymap.set({ "n", "t" }, "<C-/>", root_terminal, { desc = "Terminal (Root Dir)" })
vim.keymap.set({ "n", "t" }, "<C-_>", root_terminal, { desc = "which_key_ignore" })
