return {
    "romgrk/barbar.nvim",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        icons = {
            buffer_index = true
        }
    },
    vim.api.nvim_set_keymap('n', '<leader>b', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>f', '<Cmd>BufferNext<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true }),
    version = '^1.0.0',

}