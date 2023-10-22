vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "PKGBUILD", "*.install" },
  callback = function()
    vim.lsp.start({
      name = "pkgbuild",
      cmd = { "pkgbuild-language-server" }
    })
  end,
})
