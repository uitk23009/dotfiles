return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup()
    end,
    vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
}