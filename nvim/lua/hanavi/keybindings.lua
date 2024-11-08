-- print('loading keybindings')

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
vim.g.mapleader = " "

keymap('i', 'jk', '<esc>', opts)

keymap("n", "<leader>sv", ":vs<cr>", opts)
keymap("n", "<leader>sh", ":split<cr>", opts)
keymap("n", "<leader>sx", ":close<cr>", opts)

keymap("n", "<leader>ev", ":n ~/.config/nvim/lua/hanavi/*.lua<cr>", opts)
keymap("n", "<leader>es", ":edit ~/.vim/scripts/test.vim<cr>", opts)
keymap("n", "<leader>p", ":set paste!<CR>", opts)
keymap("n", "L", ":bn<CR>", opts)
keymap("n", "H", ":bp<CR>", opts)
keymap("n", "<c-u>", "<c-u>zz", opts)
keymap("n", "<c-d>", "<c-d>zz", opts)
keymap("n", "<leader>nh", ":noh<cr>", opts)


keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- TODO: move these to the "after" folder?
keymap("n",  "<leader>u", ":UltiSnipsEdit!<CR>", { noremap=true, silent=true })
keymap("n",  "<leader>ff", ":Telescope find_files<CR>", { noremap=true, silent=true })
keymap("n",  "<leader>bb", ":Telescope buffers<CR>", { noremap=true, silent=true })
keymap("n",  "<leader>gg", ":Telescope live_grep<CR>", { noremap=true, silent=true })
keymap("n",  "<leader>s", ":ALEToggleBuffer<CR>", { noremap=true, silent=true })
keymap("n",  "<leader>tt", ":exe 'norm a' . strftime('%F') . ' '<CR>", { noremap=true, silent=true })

-- Error console
keymap("n", "<leader>co", ":copen<cr>", opts)
keymap("n", "<leader>cc", ":ccl<cr>", opts)
keymap("n", "<leader>cp", ":cp<cr>", opts)
keymap("n", "<leader>cn", ":cn<cr>", opts)

keymap("n", "<leader>lo", ":lopen<CR>", { noremap=true, silent=true })
keymap("n", "<leader>lc", ":lclose<CR>", { noremap=true, silent=true })
keymap("n", "<leader>ll", ":ll<CR>", { noremap=true, silent=true })
keymap("n", "<leader>ln", ":lnext<CR>", { noremap=true, silent=true })
keymap("n", "<leader>lp", ":lprev<CR>", { noremap=true, silent=true })

-- Jump to marker(<++>) delete and switch to insert mode
keymap("i", "\\\\", '<Esc>/<++><Enter>"_c4l', opts)
keymap("v", "\\\\", '<Esc>/<++><Enter>"_c4l', opts)
keymap("n", "\\\\", '<Esc>/<++><Enter>"_c4l', opts)

-- Search and replace word under cursor
keymap("n", "<leader>w", ":%s/\\<<C-r><C-w>\\>/", opts)

-- Split window resizing
keymap("n", "<esc>[1;5D", "<c-Left>", opts)
keymap("n", "<esc>[1;5C", "<c-Right>", opts)
keymap("n", "<esc>[1;5A", "<c-Up>", opts)
keymap("n", "<esc>[1;5B", "<c-Down>", opts)

keymap("n", "<c-left>", ":vert resize -3<cr>", { noremap=true, silent=true })
keymap("n", "<c-right>", ":vert resize +3<cr>", { noremap=true, silent=true })
keymap("n", "<c-up>", ":resize +3<cr>", { noremap=true, silent=true })
keymap("n", "<c-down>", ":resize -3<cr>", { noremap=true, silent=true })

keymap("n", "<c-h>", "<c-w>h", { noremap=true, silent=true })
keymap("n", "<c-l>", "<c-w>l", { noremap=true, silent=true })
keymap("n", "<c-j>", "<c-w>j", { noremap=true, silent=true })
keymap("n", "<c-k>", "<c-w>k", { noremap=true, silent=true })


keymap("c", "w!!", "%!sudo tee > /dev/null %", {})
