-- ALE settings

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.g.ale_enabled = false
keymap("n", "<leader>l", ":ALEToggle<cr>", opts)
