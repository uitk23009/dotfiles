vim.g.find_git_root = function ()
    local handle = io.popen('git rev-parse --show-toplevel 2> /dev/null')
    if handle == nil then
        return 'Files'
    else
        local result = handle:read('*a')
        handle:close()
        if result == nil or result == '' then
            return 'Files'
        else
            return 'Files ' .. result:sub(1, -2)
        end
    end
end

return {
    {
        "junegunn/fzf",
        dir = "~/.fzf",
        build = "./install --bin",
        name = "fzf"
    },
    {
        "junegunn/fzf.vim",
        config = function ()
          vim.cmd([[
            augroup ProjectFilesCommand
              autocmd!
              autocmd VimEnter * command! ProjectFiles execute luaeval('vim.g.find_git_root()')
            augroup END
          ]])
          vim.keymap.set('n', '<c-p>', ':ProjectFiles<CR>', {noremap = true})
          vim.keymap.set('n', '<c-o>', ':Buffers<CR>', {noremap = true})
        end
    }
}