-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     setup = {
--       local configs = require 'lspconfig.configs'
--       if not configs['termux_ls'] then
--         configs['termux_ls'] = require 'lspconfig/server_configurations/termux_ls'
--       end
--       local server = require 'mason-lspconfig.mappings.server'
--       server.lspconfig_to_package['termux_ls'] = 'termux-language-server'
--       server.package_to_lspconfig['termux-language-server'] = 'termux_ls'
--     },
--   },
-- }

--[[ Configs for the Nvim LSP client ]]
--
--  LSP stands for Language Server Protocol. It's a protocol that helps editors
--  and language tooling communicate in a standardized fashion.
--
--  In general, you have a "server" which is some tool built to understand a particular
--  language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
--  (sometimes called LSP servers) are standalone processes that communicate with some
--  "client" - in this case, Neovim!
--
--  LSP may provide Neovim with these features (not every LSP server supports all of them):
--    - Show dianostics (syntax errors, linter issues).
--    - Show documentation for a symbol under cursor.
--    - Show signature documentation for a function's arg under cursor.
--    - Show inlay hints.
--    - Highlight related symbols.
--    - Go to symbol's definition (smarter than supported by Neovim without LSP).
--    - Go to symbol's type definition.
--    - Go to symbol's implementation/interface.
--    - Go to symbol's declaration.
--    - Search for a symbol (in a current file or a whole project).
--    - Provide smart (context-aware) autocompletions.
--    - Provide smart (context-aware) snippets.
--    - Rename identifier (everywhere in a project, not just in current file).
--    - Code actions (can be anything, but usually it's an automated fix for some diagnostic).
--    - Autoformat.
--
--  All of the code for the language server client is located in the core of neovim.
--  Lspconfig is a helper plugin that leverages the language client API in neovim core for an
--  easier to use experience. Lspconfig handles:
--
--    - Launching a language server when a matching filetype is detected.
--    - Detecting the root directory of your project (it may differs for different LSP).
--    - Sending the correct initialization options and settings (these are two separate things
--      in the LSP specification) during launch.
--    - Attaching new buffers you open to the currently active language server.

local function setup_filetypes_termux_ls()
  vim.filetype.add({
    extension = {
      -- ArchLinux/Windows Msys2
      install = 'sh.install',
      -- Gentoo
      ebuild = 'sh.ebuild',
      eclass = 'sh.eclass',
      -- Zsh
      mdd = 'sh.mdd',
    },
    filename = {
      -- Android Termux
      ['build.sh'] = 'sh.build',
      -- ArchLinux/Windows Msys2
      ['PKGBUILD'] = 'sh.PKGBUILD',
      ['makepkg.conf'] = 'sh.makepkg.conf',
    },
    pattern = {
      -- Android Termux
      ['.*%.subpackage%.sh'] = 'sh.subpackage',
      -- Gentoo
      ['.*/etc/make%.conf'] = 'sh.make.conf',
      ['.*/etc/portage/make%.conf'] = 'sh.make.conf',
      ['.*/etc/portage/color%.map'] = 'sh.color.map',
    },
  })
end

-- https://github.com/termux/termux-language-server/issues/21
local function register_termux_ls()
  local configs = require('lspconfig.configs')
  if not configs['termux_ls'] then
    configs['termux_ls'] = require('lspconfig/server_configurations/termux_ls')
  end
end

-- LSP servers and clients are able to communicate to each other what features they support.
-- By default, Neovim doesn't support everything that is in the LSP specification.
-- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
-- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
--
-- All client capabilities: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#clientCapabilities
local function make_client_capabilities()
  local override = {} -- You can override any of `cmp` capabilities.
  return vim.tbl_deep_extend(
    'force',
    -- Take Neovim's capabilities...
    vim.lsp.protocol.make_client_capabilities(),
    -- ...and extend it with `cmp` plugin's completion capabilities.
    require('cmp_nvim_lsp').default_capabilities(override)
  )
end

-- This function gets run when an LSP attaches to a particular buffer.
-- That is to say, every time a new file is opened that is associated with
-- an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
-- function will be executed to configure the current buffer.
local function handle_LspAttach(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if not client then
    return
  end

  -- Here you can hide (disable) some server capabilities from a client.
  -- All server capabilities: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
  --
  --  if client.name == 'some' then client.server_capabilities.XXX = nil end

  -- HACK: Work around https://github.com/termux/termux-language-server/issues/19#issuecomment-2200349890.
  -- if client.name == 'termux_ls' then
  --   client.server_capabilities.documentFormattingProvider = nil
  -- end
end

---@module 'lazy'
---@type LazySpec
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Setup $PATH for current project before running LSP servers.
      'project',
      -- Provides 'cmp' capabilities for LSP clients.
      'hrsh7th/cmp-nvim-lsp',
    },
    lazy = false, -- Needs to setup autocommands for LSP before creating buffers.
    init = function()
      setup_filetypes_termux_ls()
    end,
    config = function()
      register_termux_ls()

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('user.lsp.attach', { clear = true }),
        callback = handle_LspAttach,
      })

      local client_capabilities = make_client_capabilities()
      for server_name, server in pairs(require('tools.lsp')) do
        server.capabilities = vim.tbl_deep_extend('force', client_capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end
    end,
  },
}
