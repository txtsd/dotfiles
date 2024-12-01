return {
  'conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      sh = { 'shfmt' },
      js = { 'prettier' },
    },
  },
}
