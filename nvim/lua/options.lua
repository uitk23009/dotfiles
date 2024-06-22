vim.g.mapleader = ","

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'
vim.opt.ttyfast = true

-- Fix backspace indent
vim.opt.backspace = "indent,eol,start"

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true

-- Directories for swap files
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.showcmd = true
vim.opt.clipboard = "unnamed"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.termguicolors = true
vim.opt.autochdir = true
vim.opt.autoread = true

-- Buffer
vim.opt.startofline = false

-- Autocomplete
vim.opt.completeopt = "longest,menuone"

-- Performance
vim.opt.lazyredraw = true
vim.opt.hidden = true
vim.opt.regexpengine = 1

-- Command complete menu
vim.opt.wildmenu = true

vim.opt.mouse = ''
vim.opt.fillchars:append({ eob = ' '})