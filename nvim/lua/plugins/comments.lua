return {
    'numToStr/Comment.nvim',
    config = function ()
        require('Comment').setup({
            toggler = {
                line = '<C-_><C-_>'
            },
            opleader = {
                line = '<C-_>'
            },
            mapping = {
                basic = false,
                extra = false
            }
        })
    end,
}