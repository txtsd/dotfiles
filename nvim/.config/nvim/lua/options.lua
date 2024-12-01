-- Indents
local indent = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.cmd("filetype indent on")
vim.opt.shiftround = true
vim.opt.smarttab = true
vim.opt.shiftwidth = indent
vim.opt.tabstop = indent
vim.opt.softtabstop = indent

-- EOL
vim.opt.endofline = true
vim.opt.fixendofline = true

-- Search
vim.opt.hlsearch = true
vim.opt.smartcase = true

-- Text Rendering
vim.opt.encoding = "utf-8"
vim.opt.linebreak = true
vim.opt.wrap = true

-- UI
vim.opt.cursorline = true
vim.opt.title = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,100,120"

-- Code Folding
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Misc
vim.opt.backupdir = os.getenv("XDG_STATE_HOME") .. "/nvim/backup/"
vim.opt.confirm = true
vim.opt.fsync = true
vim.opt.wildignore = ".pyc,.swp,__pycache__"

-- Spellcheck
vim.opt.spelllang = "en_us,programming,cjk"

-- Whitespace
vim.opt.list = true
-- vim.opt.listchars = "space:·,tab:->,trail:-,nbsp:+,eol:\\u21b5"
vim.opt.listchars = "space:·,tab:->,trail:-,nbsp:+"
