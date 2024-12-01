return {
  'williamboman/mason.nvim',
  cmd = { 'Mason' },
  ft = { 'sh', 'bash', 'zsh', 'fish', 'shfmt', 'pkgbuild', 'c', 'cpp', 'h', 'hpp' },
  opts = {
    ensure_installed = {
      'stylua',
      'shfmt',
      'shellcheck',
      'termux-language-server',
      'prettier',
      'clang-format',
    },
  },
}
