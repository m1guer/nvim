require "nvchad.mappings"
local map = vim.keymap.set
local wk = require "which-key"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

wk.register({
  [";"] = { ":", "CMD enter command mode" },

  ["<leader>f"] = {
    t = { "<cmd>TodoTelescope<CR>", "todoTelescope" },
  },
  ["<leader>s"] = {
    name = "Session management",
    r = { "<cmd>SessionRestore<CR>", "sessionRestore" },
    s = { "<cmd>SessionSave<CR>", "sessionSave" },
  },
  ["]t"] = {
    function()
      require("todo-comments").jump_next { keywords = { "ERROR", "WARNING", "TODO", "FIX", "HACK" } }
    end,
    "Next error/warning todo comment",
  },
}, { mode = "n" })
wk.register({
  ["jk"] = { "<ESC>", "Escape insert mode" },
}, { mode = "i" })

wk.register({
  ["<A-j>"] = { ":m .+1<CR>==", "Move line down" },
  ["<A-k>"] = { ":m .-2<CR>==", "Move line up" },
}, { mode = "n" })
