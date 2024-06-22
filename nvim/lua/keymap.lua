local opts = { noremap = true }

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set('i', '<C-c>', '<ESC>', opts)
vim.keymap.set('x', '<', '<gv', opts)
vim.keymap.set('x', '>', '>gv', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<leader>d', ':bd<CR>', opts)
vim.keymap.set('n', '<leader>g', ':bufdo bw<CR>', opts)
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', opts)
vim.keymap.set('n', '<leader>s', ':split<CR>', opts)
vim.keymap.set('n', '<leader>o', '<C-w>o', opts)

vim.keymap.set('n', '<leader>cc', ':%delete _<CR>', opts)