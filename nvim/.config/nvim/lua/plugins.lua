vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  use { "catppuccin/nvim", as = "catppuccin" }
  use "editorconfig/editorconfig-vim"
  use "sidebar-nvim/sidebar.nvim"
  use "lambdalisue/suda.vim"
  use {'psliwka/vim-dirtytalk', run = ':DirtytalkUpdate'}
end)

