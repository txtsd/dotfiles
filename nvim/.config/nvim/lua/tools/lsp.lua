-- Enable the following language servers.
--
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--    - cmd (table): Override the default command used to start the server.
--    - filetypes (table): Override the default list of associated filetypes for the server.
--    - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--    - settings (table): Override the default settings passed when initializing the server.
--      For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/.
---@module 'lspconfig'
---@type table<string,lspconfig.Config>
return {
  -- It actually uses `shellcheck` and `shfmt`.
  -- Configure it in file `.shellcheckrc` in project's root dir (check `:LspInfo`).
  bashls = {},
  termux_ls = {},
}
