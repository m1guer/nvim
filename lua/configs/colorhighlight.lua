require("nvim-highlight-colors").setup {
  render = "virtual",
  virtual_symbol = "■",

  virtual_symbol_suffix = " ",

  ---Set virtual symbol position()
  ---@usage 'inline'|'eol'|'eow'
  ---inline mimics VS Code style
  ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
  ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
  virtual_symbol_position = "inline",
  virtual_symbol_prefix = " ",
  enable_hex = true,
  enable_short_hex = true,
  enable_rgb = true,
  enable_hsl = true,
  enable_var_usage = true,
  enable_named_colors = true,
  enable_tailwind = false,
  -- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
  exclude_filetypes = {},
  exclude_buftypes = {},
}
