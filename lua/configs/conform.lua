local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "biome" },
    html = { "biome" },
    python = { "black" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    javascript = { "biome" },
    javascriptreact = { "biome" },
    json = { "biome" },
    rust = { "rustfmt" },
    sql = { "sql-formatter" },
    --[[     vue = { "" }, ]]
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
