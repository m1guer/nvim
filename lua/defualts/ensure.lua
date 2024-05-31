require("mason-lspconfig").setup {
  ensure_installed = {
    "rust_analyzer",
    "pyright",
    "jedi_language_server",
    "lua_ls",
    "eslint",
    "vuels",
    "tailwindcss",
    "biome",
  },
}
require("nvim-treesitter").setup {
  ensure_installed = { "rust", "python", "typescript", "tsx", "sql", "html", "lua", "java" },
}
