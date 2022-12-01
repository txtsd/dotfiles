-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

local function map(kind, lhs, rhs, opts)
    vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end

local noremapsilent = { noremap = true, silent = true }


map("n", "q", "<cmd>SidebarNvimToggle<CR>", noremapsilent)
map("n", "zr", ":spellrare <c-r><c-w><CR>", noremapsilent)

