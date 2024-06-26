vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require "defualts.ensure"
vim.opt.listchars:append { eol = "↲" }
vim.wo.relativenumber = true
vim.o.guifont = "Zed Mono:h12"

require "configs.dadbod"
require("precognition").toggle()
require("mason-lspconfig").setup()
require("lsp-lens").setup({}, "configs.lens")
require "configs.dadbod"
require "options"
require "configs.lspconfig"
require "configs.harpoon"
require "ts-comments"
-- require "configs.colorhighlight"
vim.opt.termguicolors = true
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == "tailwindcss" then
      vim.cmd "TailwindConcealEnable"
    end
  end,
})
local autocmd = vim.api.nvim_create_autocmd

-- enable inlay hints
autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
  end,
})
