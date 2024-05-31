local SymbolKind = vim.lsp.protocol.SymbolKind
return {
  enable = true,
  include_declaration = false,
  sections = {
    definition = false,
    references = true,
    implements = true,
    git_authors = true,
  },
  ignore_filetype = {
    "prisma",
  },
  target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
  wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
}
