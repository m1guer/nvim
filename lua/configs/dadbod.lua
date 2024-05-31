local cmp = require('cmp')
local autocomplete_group = vim.api.nvim_create_augroup('vimrc_autocompletion', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    cmp.setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
  end,
  group = autocomplete_group,
})
