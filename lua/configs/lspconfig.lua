local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended

-- If the lsp setup is taken over by other plugin, it is the same to call the counterpart setup function
require("lspconfig").vtsls.setup { --[[ your custom server config here ]]
}
require("java").setup()
local servers = {
  vtsls = {
    settings = {

      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = { completeFunctionCalls = true },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
    },
  },
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
  jsonls = {},
  volar = {
    -- filetypes = {
    --   "vue",
    -- },
  },
  sqlls = {},
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
