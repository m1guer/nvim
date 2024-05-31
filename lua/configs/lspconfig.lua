-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

require("java").setup()
local util = require "lspconfig.util"
local servers = {
  html = {},
  jdtls = {},
  lua_ls = {
    settings = {
      Lua = {
        hint = { enable = true },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = {
            ["${3rd}/luv/library"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  },
  biome = {},
  cssls = {},
  tailwindcss = {},
  jedi_language_server = {},
  -- rust_analyzer = {
  --   root_dir = util.root_pattern "Cargo.toml",
  --   settings = {
  --     ["rust_analyzer"] = {
  --       cargo = {
  --         allFeatures = true,
  --       },
  --     },
  --   },
  -- },
  jsonls = {},
  volar = {
    filetypes = {
      "typescript",
      "vue",
    },
    root_dir = util.root_pattern "src/App.vue",
  },
  sqlls = {},
  vls = {},
  taplo = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}
for name, opts in pairs(servers) do
  opts.on_init = on_init
  opts.capabilities = capabilities
  opts.on_attach = on_attach
  require("lspconfig")[name].setup(opts)
end
