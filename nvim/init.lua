local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.cmd([[
augroup BladePhpFileType
  autocmd!
  autocmd BufNewFile,BufRead *.blade.php set filetype=php
augroup END
]])

require("options")
require("keymap")
require("lazy").setup("plugins")